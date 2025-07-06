import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/features/mosques/models/mosque.dart';
import 'package:iqra_wa_irtaqi/features/mosques/repositories/mosques_repository.dart';

import 'mosques_state.dart';

class MosquesCubit extends Cubit<MosquesState> {
  final MosquesRepository _repo;
  static const int _limit = 10;

  MosquesCubit(this._repo) : super(const MosquesState());

  Future<void> fetchMore() async {
    if (state.hasReachedMax || state.isLoading) return;
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final snapshot = await _repo.fetchMosques(
        startAfter: state.lastDoc,
        limit: _limit,
      );
      final docs = snapshot.docs;
      final fetched = docs
          .map((d) => Mosque.fromJson(d.data()).copyWith(id: d.id))
          .toList();
      final hasMax = docs.length < _limit;

      emit(
        state.copyWith(
          mosques: List.of(state.mosques)..addAll(fetched),
          lastDoc: docs.isNotEmpty ? docs.last : state.lastDoc,
          hasReachedMax: hasMax,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<void> refresh() async {
    emit(const MosquesState());
    await fetchMore();
  }

  void updateMosque(Mosque updated) {
    final patched = state.mosques.map((m) {
      return m.id == updated.id ? updated : m;
    }).toList();
    emit(state.copyWith(mosques: patched));
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
    final remaining = state.mosques
        .where((m) => !state.selectedIds.contains(m.id))
        .toList();
    emit(
      state.copyWith(mosques: remaining, isSelecting: false, selectedIds: {}),
    );

    for (var id in toDelete) {
      final res = await _repo.deleteMosque(id);
      if (res.isFailure) {
        // TODO: handle individual deletion errors if desired
      }
    }
  }

  void addMosque(Mosque newMosque) {
    final updated = List<Mosque>.from(state.mosques)..insert(0, newMosque);
    emit(state.copyWith(mosques: updated));
  }
}
