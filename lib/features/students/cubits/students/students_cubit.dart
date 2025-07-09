import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/features/students/cubits/students/students_state.dart';
import 'package:iqra_wa_irtaqi/features/students/models/student.dart';
import 'package:iqra_wa_irtaqi/features/students/repositories/students_repository.dart';

class StudentsCubit extends Cubit<StudentsState> {
  final StudentsRepository _repo;
  static const int _limit = 10;

  StudentsCubit(this._repo) : super(const StudentsState());

  void search(String q) {
    emit(
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
    emit(state.copyWith(isLoading: true, errorMessage: null));
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

      emit(
        state.copyWith(
          students: [...state.students, ...fetched],
          lastDoc: docs.isNotEmpty ? docs.last : state.lastDoc,
          hasReachedMax: docs.length < _limit,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> refresh() async {
    emit(const StudentsState());
    await fetchMore();
  }

  void addStudent(Student s) {
    final updated = [s, ...state.students];
    emit(state.copyWith(students: updated));
  }

  void updateStudent(Student s) {
    final patched = state.students.map((st) => st.id == s.id ? s : st).toList();
    emit(state.copyWith(students: patched));
  }

  void toggleSelectionMode() {
    emit(
      state.copyWith(
        isSelecting: !state.isSelecting,
        selectedIds: state.isSelecting ? {} : state.selectedIds,
      ),
    );
  }

  void toggleSelect(String id) {
    final ids = Set<String>.of(state.selectedIds);
    if (!ids.add(id)) ids.remove(id);
    emit(state.copyWith(selectedIds: ids));
  }

  Future<void> deleteSelected() async {
    final toDelete = state.selectedIds.toList();
    final remaining = state.students
        .where((s) => !state.selectedIds.contains(s.id))
        .toList();
    emit(
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
