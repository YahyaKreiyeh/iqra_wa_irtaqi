import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/constants/enums.dart';
import 'package:iqra_wa_irtaqi/core/mixins/cubit_mixin.dart';
import 'package:iqra_wa_irtaqi/features/centers/repositories/centers_repository.dart';
import 'package:iqra_wa_irtaqi/features/institutes/repositories/institutes_repository.dart';
import 'package:iqra_wa_irtaqi/features/teachers/models/teacher.dart';
import 'package:iqra_wa_irtaqi/features/teachers/repositories/teachers_repository.dart';

import 'teachers_state.dart';

class TeachersCubit extends Cubit<TeachersState>
    with SafeEmitter<TeachersState> {
  final TeachersRepository _repo;
  final CentersRepository _centersRepo;
  final InstitutesRepository _institutesRepo;
  static const int _limit = 10;

  TeachersCubit(this._repo, this._centersRepo, this._institutesRepo)
    : super(const TeachersState());

  void fetchMore() async {
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
      safeEmit(
        state.copyWith(
          teachers: [...state.teachers, ...fetched],
          lastDoc: docs.isNotEmpty ? docs.last : state.lastDoc,
          hasReachedMax: docs.length < _limit,
          isLoading: false,
        ),
      );
    } catch (e) {
      safeEmit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

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

  void addTeacher(Teacher t) {
    final upd = [t, ...state.teachers];
    safeEmit(state.copyWith(teachers: upd));
  }

  void updateTeacher(Teacher t) {
    final upd = state.teachers.map((x) => x.id == t.id ? t : x).toList();
    safeEmit(state.copyWith(teachers: upd));
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
      await _repo.deleteTeacher(id);

      try {
        await _centersRepo.clearManagerReferences(id);
      } catch (_) {}

      try {
        await _institutesRepo.clearManagerReferences(id);
      } catch (_) {}
    }
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

  void handleBulk(BulkAction action) {
    final allIds = state.teachers.map((t) => t.id).toSet();
    switch (action) {
      case BulkAction.selectAll:
        safeEmit(state.copyWith(selectedIds: allIds));
        break;
      case BulkAction.clearSelection:
        safeEmit(state.copyWith(selectedIds: {}));
        break;
      case BulkAction.invertSelection:
        safeEmit(
          state.copyWith(selectedIds: allIds.difference(state.selectedIds)),
        );
        break;
    }
  }
}
