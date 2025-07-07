import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/features/centers/cubits/centers/centers_state.dart';
import 'package:iqra_wa_irtaqi/features/centers/models/center.dart';
import 'package:iqra_wa_irtaqi/features/centers/repositories/centers_repository.dart';

class CentersCubit extends Cubit<CentersState> {
  final CentersRepository _repo;
  static const int _limit = 10;

  CentersCubit(this._repo) : super(const CentersState());

  void search(String q) {
    emit(
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
    emit(state.copyWith(isLoading: true, errorMessage: null));

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

      emit(
        state.copyWith(
          centers: [...state.centers, ...fetched],
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
    emit(const CentersState());
    await fetchMore();
  }

  void updateCenter(Center updated) {
    final patched = state.centers.map((c) {
      return c.id == updated.id ? updated : c;
    }).toList();
    emit(state.copyWith(centers: patched));
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
    final remaining = state.centers
        .where((c) => !state.selectedIds.contains(c.id))
        .toList();
    emit(
      state.copyWith(centers: remaining, isSelecting: false, selectedIds: {}),
    );

    for (var id in toDelete) {
      final res = await _repo.deleteCenter(id);
      if (res.isFailure) {
        // TODO: handle individual deletion errors if desired
      }
    }
  }

  void addCenter(Center newCenter) {
    final updated = List<Center>.from(state.centers)..insert(0, newCenter);
    emit(state.copyWith(centers: updated));
  }
}
