import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/mixins/cubit_mixin.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/features/centers/models/center.dart' as ce;
import 'package:iqra_wa_irtaqi/features/institutes/models/institute.dart';
import 'package:iqra_wa_irtaqi/features/institutes/repositories/institutes_repository.dart';

import 'institutes_state.dart';

class InstitutesCubit extends Cubit<InstitutesState>
    with SafeEmitter<InstitutesState> {
  final InstitutesRepository _repo;
  static const int _limit = 10;

  InstitutesCubit(this._repo) : super(const InstitutesState());

  void initialize(ce.Center? center) {
    safeEmit(state.copyWith(center: center));
    fetchMore();
  }

  void updateCenter(ce.Center updated) {
    safeEmit(state.copyWith(center: updated));
  }

  void search(String q) {
    safeEmit(
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
    safeEmit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final snap = state.query.isEmpty
          ? await _repo.fetchInstitutes(
              startAfter: state.lastDoc,
              limit: _limit,
              centerId: state.center?.id,
            )
          : await _repo.searchInstitutes(
              q: state.query,
              startAfter: state.lastDoc,
              limit: _limit,
              centerId: state.center?.id,
            );

      final docs = snap.docs;
      final fetched = docs
          .map((d) => Institute.fromJson(d.data()).copyWith(id: d.id))
          .toList();
      final done = docs.length < _limit;

      safeEmit(
        state.copyWith(
          institutes: [...state.institutes, ...fetched],
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
    safeEmit(const InstitutesState());
    await fetchMore();
  }

  void updateInstitute(Institute updated) {
    final patched = state.institutes
        .map((m) => m.id == updated.id ? updated : m)
        .toList();
    safeEmit(state.copyWith(institutes: patched));
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
    final remaining = state.institutes
        .where((m) => !state.selectedIds.contains(m.id))
        .toList();
    safeEmit(
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
    safeEmit(state.copyWith(institutes: updated));
  }
}
