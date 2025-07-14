import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/mixins/cubit_mixin.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/features/centers/repositories/centers_repository.dart';
import 'package:iqra_wa_irtaqi/features/institutes/repositories/institutes_repository.dart';
import 'package:iqra_wa_irtaqi/features/teachers/cubits/teachers/teachers_state.dart';
import 'package:iqra_wa_irtaqi/features/teachers/models/teacher.dart';
import 'package:iqra_wa_irtaqi/features/teachers/repositories/teachers_repository.dart';

class TeachersCubit extends Cubit<TeachersState>
    with SafeEmitter<TeachersState> {
  final TeachersRepository _repo;
  final CentersRepository _centersRepo;
  final InstitutesRepository _institutesRepo;
  static const int _limit = 10;

  TeachersCubit(this._repo, this._centersRepo, this._institutesRepo)
    : super(const TeachersState());

  void search(String q) {
    safeEmit(
      state.copyWith(
        query: q,
        teachers: [],
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
          ? await _repo.fetchTeachers(startAfter: state.lastDoc, limit: _limit)
          : await _repo.searchTeachers(
              q: state.query,
              startAfter: state.lastDoc,
              limit: _limit,
            );

      final docs = snap.docs;
      final fetched = docs
          .map((d) => Teacher.fromJson(d.data()).copyWith(id: d.id))
          .toList();
      final done = docs.length < _limit;

      safeEmit(
        state.copyWith(
          teachers: [...state.teachers, ...fetched],
          lastDoc: docs.isNotEmpty ? docs.last : state.lastDoc,
          hasReachedMax: done,
          isLoading: false,
        ),
      );
    } catch (e) {
      safeEmit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> refresh() async {
    safeEmit(const TeachersState());
    await fetchMore();
  }

  void updateTeacher(Teacher updated) {
    final patched = state.teachers
        .map((t) => t.id == updated.id ? updated : t)
        .toList();
    safeEmit(state.copyWith(teachers: patched));
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
    final remaining = state.teachers
        .where((t) => !state.selectedIds.contains(t.id))
        .toList();
    safeEmit(
      state.copyWith(teachers: remaining, isSelecting: false, selectedIds: {}),
    );

    for (var id in toDelete) {
      final res = await _repo.deleteTeacher(id);
      if (res.isFailure) {}
      try {
        await _centersRepo.clearManagerReferences(id);
      } catch (_) {
        // ignore
      }
      try {
        await _institutesRepo.clearManagerReferences(id);
      } catch (_) {
        // ignore
      }
    }
  }

  void addTeacher(Teacher newTeacher) {
    final updated = List<Teacher>.from(state.teachers)..insert(0, newTeacher);
    safeEmit(state.copyWith(teachers: updated));
  }
}
