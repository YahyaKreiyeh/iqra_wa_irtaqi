import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/mixins/cubit_mixin.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/features/students/cubits/students/students_state.dart';
import 'package:iqra_wa_irtaqi/features/students/models/student.dart';
import 'package:iqra_wa_irtaqi/features/students/repositories/students_repository.dart';

class StudentsCubit extends Cubit<StudentsState>
    with SafeEmitter<StudentsState> {
  final StudentsRepository _repo;
  static const int _limit = 10;

  StudentsCubit(this._repo) : super(const StudentsState());

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
          ? await _repo.fetchStudents(startAfter: state.lastDoc, limit: _limit)
          : await _repo.searchStudents(
              q: state.query,
              startAfter: state.lastDoc,
              limit: _limit,
            );

      final docs = snap.docs;
      final fetched = docs.map((d) {
        final s = Student.fromJson(d.data());
        return s.copyWith(id: d.id);
      }).toList();

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

  Future<void> refresh() async {
    safeEmit(const StudentsState());
    await fetchMore();
  }

  void addStudent(Student s) {
    final updated = [s, ...state.students];
    safeEmit(state.copyWith(students: updated));
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
      state.copyWith(students: remaining, isSelecting: false, selectedIds: {}),
    );

    for (var id in toDelete) {
      final res = await _repo.deleteStudent(id);
      if (res.isFailure) {
        // TODO: per-student error handling if needed
      }
    }
  }
}

extension BatchOperations on StudentsCubit {
  void toggleSelectAll() {
    final allIds = state.students.map((s) => s.id).toSet();
    final newIds = state.selectedIds.length == allIds.length
        ? <String>{}
        : allIds;
    safeEmit(state.copyWith(selectedIds: newIds));
  }

  Future<void> batchNominateGhaibi(bool nominate) async {
    await _batchUpdate((s) => s.copyWith(nominatedGhaibi: nominate));
  }

  Future<void> batchNominateNazari(bool nominate) async {
    await _batchUpdate((s) => s.copyWith(nominatedNazari: nominate));
  }

  Future<void> batchNominateHadith(bool nominate) async {
    await _batchUpdate((s) => s.copyWith(nominatedHadith: nominate));
  }

  Future<void> batchGradeGhaibi(bool passed) async {
    await _batchUpdate((s) => s.copyWith(examPassedGhaibi: passed));
  }

  Future<void> batchGradeNazari(bool passed) async {
    await _batchUpdate((s) => s.copyWith(examPassedNazari: passed));
  }

  Future<void> batchGradeHadith(bool passed) async {
    await _batchUpdate((s) => s.copyWith(examPassedHadith: passed));
  }

  Future<void> _batchUpdate(Student Function(Student) transform) async {
    final ids = state.selectedIds.toList();
    for (var id in ids) {
      final old = state.students.firstWhere((s) => s.id == id);
      final updated = transform(old);
      final res = await _repo.updateStudent(id, updated);
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

  void _clearSelection() {
    safeEmit(state.copyWith(isSelecting: false, selectedIds: {}));
  }
}
