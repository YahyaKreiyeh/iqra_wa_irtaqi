import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/mixins/cubit_mixin.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/features/centers/cubits/centers/centers_state.dart';
import 'package:iqra_wa_irtaqi/features/centers/models/center.dart';
import 'package:iqra_wa_irtaqi/features/centers/repositories/centers_repository.dart';
import 'package:iqra_wa_irtaqi/features/institutes/repositories/institutes_repository.dart';

class CentersCubit extends Cubit<CentersState> with SafeEmitter<CentersState> {
  final CentersRepository _repo;
  final InstitutesRepository _institutesRepo;
  static const int _limit = 10;

  CentersCubit(this._repo, this._institutesRepo) : super(const CentersState());

  void search(String q) {
    safeEmit(
      state.copyWith(
        query: q,
        centers: [],
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
          ? await _repo.fetchCenters(startAfter: state.lastDoc, limit: _limit)
          : await _repo.searchCenters(
              q: state.query,
              startAfter: state.lastDoc,
              limit: _limit,
            );

      final docs = snap.docs;
      final fetched = docs
          .map((d) => Center.fromJson(d.data()).copyWith(id: d.id))
          .toList();
      final done = docs.length < _limit;

      safeEmit(
        state.copyWith(
          centers: [...state.centers, ...fetched],
          lastDoc: docs.isNotEmpty ? docs.last : state.lastDoc,
          hasReachedMax: done,
          isLoading: false,
        ),
      );
    } catch (e) {
      safeEmit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void updateCenter(Center updated) {
    final patched = state.centers.map((c) {
      return c.id == updated.id ? updated : c;
    }).toList();
    safeEmit(state.copyWith(centers: patched));
  }

  void toggleSelectionMode() {
    if (state.isSelecting) {
      safeEmit(state.copyWith(isSelecting: false, selectedIds: {}));
    } else {
      safeEmit(state.copyWith(isSelecting: true));
    }
  }

  void toggleSelect(String id) {
    final ids = Set<String>.of(state.selectedIds);
    if (!ids.add(id)) ids.remove(id);
    safeEmit(state.copyWith(selectedIds: ids));
  }

  Future<void> deleteSelected() async {
    final toDelete = state.selectedIds.toList();
    final remaining = state.centers
        .where((c) => !state.selectedIds.contains(c.id))
        .toList();

    // Optimistically remove from UI
    safeEmit(
      state.copyWith(centers: remaining, isSelecting: false, selectedIds: {}),
    );

    for (var id in toDelete) {
      // 1) delete the center document
      final res = await _repo.deleteCenter(id);
      if (res.isFailure) {
        // TODO: you might choose to re-add it on failure
      }

      // 2) cascade: clear centerId on any institutes that referenced it
      try {
        await _institutesRepo.clearCenterReferences(id);
      } catch (_) {
        // ignore or log; no user-impact
      }
    }
  }

  void addCenter(Center newCenter) {
    final updated = List<Center>.from(state.centers)..insert(0, newCenter);
    safeEmit(state.copyWith(centers: updated));
  }

  void selectAll(Set<String> allIds) {
    safeEmit(state.copyWith(selectedIds: allIds));
  }

  void clearSelection() {
    safeEmit(state.copyWith(selectedIds: {}));
  }

  void invertSelection({required Set<String> allIds}) {
    final newSelection = <String>{};
    for (var id in allIds) {
      if (!state.selectedIds.contains(id)) {
        newSelection.add(id);
      }
    }
    safeEmit(state.copyWith(selectedIds: newSelection));
  }
}
