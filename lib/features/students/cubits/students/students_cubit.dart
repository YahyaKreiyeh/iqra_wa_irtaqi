import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/constants/enums.dart';
import 'package:iqra_wa_irtaqi/core/mixins/cubit_mixin.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/features/institutes/models/institute.dart';
import 'package:iqra_wa_irtaqi/features/students/cubits/students/students_state.dart';
import 'package:iqra_wa_irtaqi/features/students/models/student.dart';
import 'package:iqra_wa_irtaqi/features/students/repositories/students_repository.dart';

class StudentsCubit extends Cubit<StudentsState>
    with SafeEmitter<StudentsState> {
  final StudentsRepository _repo;
  static const int _limit = 10;

  StudentsCubit(this._repo) : super(const StudentsState());

  void initialize(Institute? institute) {
    safeEmit(state.copyWith(institute: institute));
    fetchStudentCount();
    fetchMore();
  }

  void updateInstitute(Institute updated) {
    safeEmit(state.copyWith(institute: updated));
  }

  void search(String q) {
    safeEmit(
      state.copyWith(
        query: q,
        students: [],
        lastDoc: null,
        hasReachedMax: false,
        errorMessage: null,
      ),
    );
    fetchMore();
  }

  Future<void> fetchMore() async {
    if (state.hasReachedMax || state.isLoading) return;
    safeEmit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final snap = state.query.isEmpty
          ? await _repo.fetchStudents(
              startAfter: state.lastDoc,
              limit: _limit,
              instituteId: state.institute?.id,
            )
          : await _repo.searchStudents(
              q: state.query,
              startAfter: state.lastDoc,
              limit: _limit,
              instituteId: state.institute?.id,
            );

      final docs = snap.docs;
      final fetched = docs
          .map((d) => Student.fromJson(d.data()).copyWith(id: d.id))
          .toList();
      safeEmit(
        state.copyWith(
          students: [...state.students, ...fetched],
          lastDoc: docs.isNotEmpty ? docs.last : state.lastDoc,
          hasReachedMax: docs.length < _limit,
          isLoading: false,
        ),
      );
    } catch (e) {
      safeEmit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void addStudent(Student s) {
    final updated = [s, ...state.students];
    safeEmit(
      state.copyWith(students: updated, totalCount: state.totalCount + 1),
    );
  }

  void updateStudent(Student s) {
    final patched = state.students.map((st) => st.id == s.id ? s : st).toList();
    safeEmit(state.copyWith(students: patched));
  }

  void toggleSelectionMode() {
    safeEmit(
      state.copyWith(
        isSelecting: !state.isSelecting,
        selectedIds: state.isSelecting ? {} : state.selectedIds,
      ),
    );
  }

  void toggleSelect(String id) {
    final ids = Set<String>.of(state.selectedIds);
    if (!ids.add(id)) ids.remove(id);
    safeEmit(state.copyWith(selectedIds: ids));
  }

  Future<void> deleteSelected() async {
    final toDelete = state.selectedIds.toList();
    final remaining = state.students
        .where((s) => !state.selectedIds.contains(s.id))
        .toList();

    safeEmit(
      state.copyWith(
        students: remaining,
        totalCount: remaining.length,
        isSelecting: false,
        selectedIds: {},
      ),
    );

    for (var id in toDelete) {
      final res = await _repo.deleteStudent(id);
      if (res.isFailure) {}
    }
  }

  void handleBatch(BatchAction action) {
    switch (action) {
      case BatchAction.selectAll:
        _selectAll();
        break;
      case BatchAction.clearSelection:
        _clearSelection();
        break;
      case BatchAction.invertSelection:
        _invertSelection();
        break;
      case BatchAction.nominateGhaibi:
        _batchNominate((s) => s.copyWith(nominatedGhaibi: true));
        break;
      case BatchAction.unnominateGhaibi:
        _batchNominate((s) => s.copyWith(nominatedGhaibi: false));
        break;
      case BatchAction.nominateNazari:
        _batchNominate((s) => s.copyWith(nominatedNazari: true));
        break;
      case BatchAction.unnominateNazari:
        _batchNominate((s) => s.copyWith(nominatedNazari: false));
        break;
      case BatchAction.nominateHadith:
        _batchNominate((s) => s.copyWith(nominatedHadith: true));
        break;
      case BatchAction.unnominateHadith:
        _batchNominate((s) => s.copyWith(nominatedHadith: false));
        break;
      case BatchAction.gradeGhaibiPassed:
        _batchGrade(
          (s) => s.nominatedGhaibi,
          (s) => s.copyWith(examPassedGhaibi: true),
        );
        break;
      case BatchAction.gradeGhaibiFailed:
        _batchGrade(
          (s) => s.nominatedGhaibi,
          (s) => s.copyWith(examPassedGhaibi: false),
        );
        break;
      case BatchAction.gradeNazariPassed:
        _batchGrade(
          (s) => s.nominatedNazari,
          (s) => s.copyWith(examPassedNazari: true),
        );
        break;
      case BatchAction.gradeNazariFailed:
        _batchGrade(
          (s) => s.nominatedNazari,
          (s) => s.copyWith(examPassedNazari: false),
        );
        break;
      case BatchAction.gradeHadithPassed:
        _batchGrade(
          (s) => s.nominatedHadith,
          (s) => s.copyWith(examPassedHadith: true),
        );
        break;
      case BatchAction.gradeHadithFailed:
        _batchGrade(
          (s) => s.nominatedHadith,
          (s) => s.copyWith(examPassedHadith: false),
        );
        break;
    }
  }

  void _selectAll() {
    final allIds = state.students.map((s) => s.id).toSet();
    safeEmit(state.copyWith(selectedIds: allIds));
  }

  void _clearSelection() {
    safeEmit(state.copyWith(selectedIds: {}));
  }

  void _invertSelection() {
    final allIds = state.students.map((s) => s.id).toSet();
    final inverted = allIds.difference(state.selectedIds);
    safeEmit(state.copyWith(selectedIds: inverted));
  }

  Future<void> _batchNominate(Student Function(Student) transform) async {
    final ids = state.selectedIds.toList();
    for (var id in ids) {
      final old = state.students.firstWhere((s) => s.id == id);
      final updated = transform(old);
      final res = await _repo.updateStudent(id, updated);
      if (res.isSuccess) _updateLocal(updated);
    }
    _clearSelection();
  }

  Future<void> _batchGrade(
    bool Function(Student) predicate,
    Student Function(Student) transform,
  ) async {
    final toGrade = state.students.where(
      (s) => predicate(s) && state.selectedIds.contains(s.id),
    );
    for (var s in toGrade) {
      final updated = transform(s);
      final res = await _repo.updateStudent(s.id, updated);
      if (res.isSuccess) _updateLocal(updated);
    }
    _clearSelection();
  }

  void _updateLocal(Student updated) {
    final patched = state.students
        .map((s) => s.id == updated.id ? updated : s)
        .toList();
    safeEmit(state.copyWith(students: patched));
  }

  Future<void> fetchStudentCount() async {
    try {
      final count = await _repo.countStudents(instituteId: state.institute?.id);
      safeEmit(state.copyWith(totalCount: count));
    } catch (_) {}
  }
}
