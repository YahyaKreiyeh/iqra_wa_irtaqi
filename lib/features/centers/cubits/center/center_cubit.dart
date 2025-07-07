import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/features/centers/models/center.dart';
import 'package:iqra_wa_irtaqi/features/centers/repositories/centers_repository.dart';

import 'center_state.dart';

class CenterCubit extends Cubit<CenterState> {
  final CentersRepository _repo;

  CenterCubit(this._repo) : super(CenterState());

  void initialize(Center? initialCenter) {
    if (initialCenter == null) return;

    emit(
      state.copyWith(
        id: initialCenter.id,
        isEditing: true,
        initialName: initialCenter.name,
        initialLocation: initialCenter.location,
        initialNotes: initialCenter.notes ?? '',
        name: initialCenter.name,
        location: initialCenter.location,
        notes: initialCenter.notes ?? '',
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

    final center = Center(
      id: state.id,
      name: state.name,
      location: state.location,
      notes: state.notes.isEmpty ? null : state.notes,
    );

    if (state.isEditing) {
      final result = await _repo.updateCenter(state.id, center);
      emit(state.copyWith(status: result));
    } else {
      final result = await _repo.createCenter(center);
      result.when(
        success: (newId) {
          emit(
            state.copyWith(status: const Result.success(data: null), id: newId),
          );
        },
        failure: (err, _, msg) {
          emit(
            state.copyWith(
              status: Result.failure(error: err, data: null, errorMessage: msg),
            ),
          );
        },
        loading: () {},
        empty: () {},
      );
    }
  }
}
