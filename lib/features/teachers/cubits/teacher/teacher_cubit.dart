import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/features/teachers/models/teacher.dart';
import 'package:iqra_wa_irtaqi/features/teachers/repositories/teachers_repository.dart';

import 'teacher_state.dart';

class TeacherCubit extends Cubit<TeacherState> {
  final TeachersRepository _repo;

  TeacherCubit(this._repo) : super(TeacherState());

  void initialize(Teacher? initial) {
    if (initial == null) return;
    emit(
      state.copyWith(
        id: initial.id,
        isEditing: true,
        initialFirstName: initial.firstName,
        initialLastName: initial.lastName,
        initialMotherName: initial.motherName,
        initialFatherName: initial.fatherName,
        initialBirthDate: initial.birthDate,
        firstName: initial.firstName,
        lastName: initial.lastName,
        motherName: initial.motherName,
        fatherName: initial.fatherName,
        birthDate: initial.birthDate,
      ),
    );
  }

  void firstNameChanged(String v) => emit(
    state.copyWith(
      firstName: v,
      firstNameError: v.isNotEmpty ? null : 'required',
    ),
  );

  void lastNameChanged(String v) => emit(
    state.copyWith(
      lastName: v,
      lastNameError: v.isNotEmpty ? null : 'required',
    ),
  );

  void motherNameChanged(String v) => emit(
    state.copyWith(
      motherName: v,
      motherNameError: v.isNotEmpty ? null : 'required',
    ),
  );

  void fatherNameChanged(String v) => emit(
    state.copyWith(
      fatherName: v,
      fatherNameError: v.isNotEmpty ? null : 'required',
    ),
  );

  void birthDateChanged(DateTime d) => emit(state.copyWith(birthDate: d));

  Future<void> submit() async {
    // 0) If we were already in a “confirm duplicate?” state, clear it
    if (state.shouldConfirmDuplicate) {
      emit(state.copyWith(shouldConfirmDuplicate: false));
    }

    // 1) Field validation
    final fnErr = state.firstName.isEmpty ? 'required' : null;
    final lnErr = state.lastName.isEmpty ? 'required' : null;
    final mnErr = state.motherName.isEmpty ? 'required' : null;
    final faErr = state.fatherName.isEmpty ? 'required' : null;
    final bdErr = state.birthDate == null ? 'required' : null;

    if ([fnErr, lnErr, mnErr, faErr, bdErr].any((e) => e != null)) {
      emit(
        state.copyWith(
          firstNameError: fnErr,
          lastNameError: lnErr,
          motherNameError: mnErr,
          fatherNameError: faErr,
        ),
      );
      return;
    }

    // 2) Duplicate check (always, even in edit mode)
    final matches = await _repo.findMatching(
      firstName: state.firstName,
      lastName: state.lastName,
      motherName: state.motherName,
      fatherName: state.fatherName,
      birthDate: state.birthDate!,
    );

    // ignore your own document when editing
    final duplicates = matches.docs.where((doc) => doc.id != state.id).toList();

    if (duplicates.isNotEmpty) {
      // this will now always emit a *new* true value,
      // even if you’d previously cancelled it
      emit(state.copyWith(shouldConfirmDuplicate: true));
      return;
    }

    // 3) No duplicates → proceed
    _performSave();
  }

  void confirmDuplicateAndSubmit() {
    emit(state.copyWith(shouldConfirmDuplicate: false));
    _performSave();
  }

  void _performSave() async {
    emit(state.copyWith(status: const Result.loading()));
    final teacher = Teacher(
      id: state.id,
      firstName: state.firstName,
      lastName: state.lastName,
      motherName: state.motherName,
      fatherName: state.fatherName,
      birthDate: state.birthDate!,
    );
    if (state.isEditing) {
      final res = await _repo.updateTeacher(state.id, teacher);
      emit(state.copyWith(status: res));
    } else {
      final res = await _repo.createTeacher(teacher);
      res.when(
        success: (newId) => emit(
          state.copyWith(status: const Result.success(data: null), id: newId),
        ),
        failure: (e, _, msg) => emit(
          state.copyWith(
            status: Result.failure(error: e, data: null, errorMessage: msg),
          ),
        ),
        loading: () {},
        empty: () {},
      );
    }
  }
}
