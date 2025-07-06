import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/features/mosques/models/mosque.dart';
import 'package:iqra_wa_irtaqi/features/mosques/repositories/mosques_repository.dart';

import 'mosque_state.dart';

class MosqueCubit extends Cubit<MosqueState> {
  final MosquesRepository _repo;

  MosqueCubit(this._repo) : super(MosqueState());

  void initialize(Mosque? initialMosque) {
    if (initialMosque == null) return;

    emit(
      state.copyWith(
        isEditing: true,
        initialName: initialMosque.name,
        initialLocation: initialMosque.location,
        initialNotes: initialMosque.notes ?? '',
        name: initialMosque.name,
        location: initialMosque.location,
        notes: initialMosque.notes ?? '',
      ),
    );
  }

  void nameChanged(String val) {
    emit(
      state.copyWith(
        name: val,
        nameErrorKey: val.isNotEmpty ? null : 'required',
      ),
    );
  }

  void locationChanged(String val) {
    emit(
      state.copyWith(
        location: val,
        locationErrorKey: val.isNotEmpty ? null : 'required',
      ),
    );
  }

  void notesChanged(String val) {
    emit(state.copyWith(notes: val));
  }

  Future<void> submit() async {
    final nameErr = state.name.isEmpty ? 'required' : null;
    final locErr = state.location.isEmpty ? 'required' : null;
    if (nameErr != null || locErr != null) {
      emit(state.copyWith(nameErrorKey: nameErr, locationErrorKey: locErr));
      return;
    }

    emit(state.copyWith(status: const Result.loading()));

    final mosque = Mosque(
      name: state.name,
      location: state.location,
      notes: state.notes.isEmpty ? null : state.notes,
    );
    final result = await _repo.createMosque(mosque);

    emit(state.copyWith(status: result));
  }
}
