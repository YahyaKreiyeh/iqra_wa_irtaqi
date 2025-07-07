import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/features/institutes/models/institute.dart';
import 'package:iqra_wa_irtaqi/features/institutes/repositories/institutes_repository.dart';

import 'institutes_state.dart';

class InstitutesCubit extends Cubit<InstitutesState> {
  final InstitutesRepository _repo;
  static const int _limit = 10;

  InstitutesCubit(this._repo) : super(const InstitutesState());

  void search(String q) {
    emit(
      state.copyWith(
        query: q,
        institutes: [],
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
          ? await _repo.fetchInstitutes(
              startAfter: state.lastDoc,
              limit: _limit,
            )
          : await _repo.searchInstitutes(
              q: state.query,
              startAfter: state.lastDoc,
              limit: _limit,
            );

      final docs = snap.docs;
      final fetched = docs
          .map((d) => Institute.fromJson(d.data()).copyWith(id: d.id))
          .toList();
      final done = docs.length < _limit;

      emit(
        state.copyWith(
          institutes: [...state.institutes, ...fetched],
          lastDoc: docs.isNotEmpty ? docs.last : state.lastDoc,
          hasReachedMax: done,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> refresh() async {
    emit(const InstitutesState());
    await fetchMore();
  }

  void updateInstitute(Institute updated) {
    final patched = state.institutes.map((m) {
      return m.id == updated.id ? updated : m;
    }).toList();
    emit(state.copyWith(institutes: patched));
  }

  void toggleSelectionMode() {
    if (state.isSelecting) {
      emit(state.copyWith(isSelecting: false, selectedIds: {}));
    } else {
      emit(state.copyWith(isSelecting: true));
    }
  }

  void toggleSelect(String id) {
    final ids = Set<String>.of(state.selectedIds);
    if (!ids.add(id)) ids.remove(id);
    emit(state.copyWith(selectedIds: ids));
  }

  Future<void> deleteSelected() async {
    final toDelete = state.selectedIds.toList();
    final remaining = state.institutes
        .where((m) => !state.selectedIds.contains(m.id))
        .toList();
    emit(
      state.copyWith(
        institutes: remaining,
        isSelecting: false,
        selectedIds: {},
      ),
    );

    for (var id in toDelete) {
      final res = await _repo.deleteInstitute(id);
      if (res.isFailure) {
        // TODO: handle individual deletion errors if desired
      }
    }
  }

  void addInstitute(Institute newInstitute) {
    final updated = List<Institute>.from(state.institutes)
      ..insert(0, newInstitute);
    emit(state.copyWith(institutes: updated));
  }
}
