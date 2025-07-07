import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/features/institutes/cubits/institute/institute_state.dart';
import 'package:iqra_wa_irtaqi/features/institutes/models/institute.dart';
import 'package:iqra_wa_irtaqi/features/institutes/repositories/institutes_repository.dart';

class InstituteCubit extends Cubit<InstituteState> {
  final InstitutesRepository _repo;

  InstituteCubit(this._repo) : super(InstituteState());

  void initialize(Institute? initialInstitute) {
    if (initialInstitute == null) return;

    emit(
      state.copyWith(
        id: initialInstitute.id,
        isEditing: true,
        initialName: initialInstitute.name,
        initialLocation: initialInstitute.location,
        initialNotes: initialInstitute.notes ?? '',
        name: initialInstitute.name,
        location: initialInstitute.location,
        notes: initialInstitute.notes ?? '',
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

    final institute = Institute(
      id: state.id,
      name: state.name,
      location: state.location,
      notes: state.notes.isEmpty ? null : state.notes,
    );

    if (state.isEditing) {
      final result = await _repo.updateInstitute(state.id, institute);
      emit(state.copyWith(status: result));
    } else {
      final result = await _repo.createInstitute(institute);
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
