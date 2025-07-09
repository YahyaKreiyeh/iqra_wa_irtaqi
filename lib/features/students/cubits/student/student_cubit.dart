import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/features/students/cubits/student/student_state.dart';
import 'package:iqra_wa_irtaqi/features/students/models/student.dart';
import 'package:iqra_wa_irtaqi/features/students/repositories/students_repository.dart';

class StudentCubit extends Cubit<StudentState> {
  final StudentsRepository _repo;
  StudentCubit(this._repo) : super(StudentState());

  void initialize(Student? initial) {
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
        nominatedGhaibi: initial.nominatedGhaibi,
        nominatedNazari: initial.nominatedNazari,
        nominatedHadith: initial.nominatedHadith,
        examPassed: initial.examPassed,
      ),
    );
  }

  // field-by-field
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

  void nominatedGhaibiChanged(bool v) =>
      emit(state.copyWith(nominatedGhaibi: v));
  void nominatedNazariChanged(bool v) =>
      emit(state.copyWith(nominatedNazari: v));
  void nominatedHadithChanged(bool v) =>
      emit(state.copyWith(nominatedHadith: v));
  void examStatusChanged(bool? passed) =>
      emit(state.copyWith(examPassed: passed));

  Future<void> submit() async {
    // clear any prior duplicate flag
    if (state.shouldConfirmDuplicate) {
      emit(state.copyWith(shouldConfirmDuplicate: false));
    }

    // 1) validate mandatory fields
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

    // 2) duplicate check (always)
    final matches = await _repo.findMatching(
      firstName: state.firstName,
      lastName: state.lastName,
      motherName: state.motherName,
      fatherName: state.fatherName,
      birthDate: state.birthDate!,
    );
    final duplicates = matches.docs.where((d) => d.id != state.id).toList();
    if (duplicates.isNotEmpty) {
      emit(state.copyWith(shouldConfirmDuplicate: true));
      return;
    }

    // 3) save
    _performSave();
  }

  void confirmDuplicateAndSubmit() {
    emit(state.copyWith(shouldConfirmDuplicate: false));
    _performSave();
  }

  void _performSave() async {
    emit(state.copyWith(status: const Result.loading()));
    final s = Student(
      id: state.id,
      firstName: state.firstName,
      lastName: state.lastName,
      motherName: state.motherName,
      fatherName: state.fatherName,
      birthDate: state.birthDate!,
      nominatedGhaibi: state.nominatedGhaibi,
      nominatedNazari: state.nominatedNazari,
      nominatedHadith: state.nominatedHadith,
      examPassed: state.examPassed,
    );
    if (state.isEditing) {
      final res = await _repo.updateStudent(state.id, s);
      emit(state.copyWith(status: res));
    } else {
      final res = await _repo.createStudent(s);
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
