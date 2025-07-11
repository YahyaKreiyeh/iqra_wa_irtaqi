import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/mixins/cubit_mixin.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/features/centers/models/center.dart';
import 'package:iqra_wa_irtaqi/features/centers/repositories/centers_repository.dart';
import 'package:iqra_wa_irtaqi/features/teachers/models/teacher.dart';
import 'package:iqra_wa_irtaqi/features/teachers/repositories/teachers_repository.dart';

import 'center_state.dart';

class CenterCubit extends Cubit<CenterState> with SafeEmitter<CenterState> {
  final CentersRepository _centersRepo;
  final TeachersRepository _teachersRepo;

  CenterCubit(this._centersRepo, this._teachersRepo) : super(CenterState());

  Future<void> initialize(Center? initialCenter) async {
    safeEmit(state.copyWith(managersResult: const Result.loading()));
    if (initialCenter != null) {
      safeEmit(
        state.copyWith(
          id: initialCenter.id,
          isEditing: true,
          initialName: initialCenter.name,
          initialLocation: initialCenter.location,
          initialNotes: initialCenter.notes ?? '',
          name: initialCenter.name,
          location: initialCenter.location,
          notes: initialCenter.notes ?? '',
          initialManagerId: initialCenter.managerId,
          managerId: initialCenter.managerId,
        ),
      );
    }
    try {
      final snap = await _teachersRepo.fetchTeachers(
        startAfter: null,
        limit: 1000,
      );
      final list = snap.docs
          .map((d) => Teacher.fromJson(d.data()).copyWith(id: d.id))
          .toList();
      safeEmit(state.copyWith(managersResult: Result.success(data: list)));
    } catch (e) {
      safeEmit(
        state.copyWith(
          managersResult: Result.failure(
            error: Exception(e.toString()),
            data: null,
            errorMessage: e.toString(),
          ),
        ),
      );
    }
  }

  void managerChanged(String? id) {
    safeEmit(state.copyWith(managerId: id));
  }

  void nameChanged(String val) {
    safeEmit(
      state.copyWith(
        name: val,
        nameErrorKey: val.isNotEmpty ? null : 'required',
      ),
    );
  }

  void locationChanged(String val) {
    safeEmit(
      state.copyWith(
        location: val,
        locationErrorKey: val.isNotEmpty ? null : 'required',
      ),
    );
  }

  void notesChanged(String val) {
    safeEmit(state.copyWith(notes: val));
  }

  Future<void> submit() async {
    final nameErr = state.name.isEmpty ? 'required' : null;
    final locErr = state.location.isEmpty ? 'required' : null;
    if (nameErr != null || locErr != null) {
      safeEmit(state.copyWith(nameErrorKey: nameErr, locationErrorKey: locErr));
      return;
    }

    safeEmit(state.copyWith(status: const Result.loading()));

    final center = Center(
      id: state.id,
      name: state.name,
      location: state.location,
      notes: state.notes.isEmpty ? null : state.notes,
      managerId: state.managerId,
    );

    if (state.isEditing) {
      final result = await _centersRepo.updateCenter(state.id, center);
      safeEmit(state.copyWith(status: result));
    } else {
      final result = await _centersRepo.createCenter(center);
      result.when(
        success: (newId) {
          safeEmit(
            state.copyWith(status: const Result.success(data: null), id: newId),
          );
        },
        failure: (err, _, msg) {
          safeEmit(
            state.copyWith(
              status: Result.failure(error: err, data: null, errorMessage: msg),
            ),
          );
        },
        loading: () {
          safeEmit(state.copyWith(status: const Result.loading()));
        },
        empty: () {},
      );
    }
  }
}
