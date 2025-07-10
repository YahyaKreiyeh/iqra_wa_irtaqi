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
        examPassedGhaibi: initial.examPassedGhaibi,
        examPassedNazari: initial.examPassedNazari,
        examPassedHadith: initial.examPassedHadith,
      ),
    );
  }

  // basic fields
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

  // nomination flags
  void nominatedGhaibiChanged(bool v) =>
      emit(state.copyWith(nominatedGhaibi: v));
  void nominatedNazariChanged(bool v) =>
      emit(state.copyWith(nominatedNazari: v));
  void nominatedHadithChanged(bool v) =>
      emit(state.copyWith(nominatedHadith: v));

  // per-exam pass/fail
  void examGhaibiStatusChanged(bool? v) =>
      emit(state.copyWith(examPassedGhaibi: v, examGhaibiError: null));
  void examNazariStatusChanged(bool? v) =>
      emit(state.copyWith(examPassedNazari: v, examNazariError: null));
  void examHadithStatusChanged(bool? v) =>
      emit(state.copyWith(examPassedHadith: v, examHadithError: null));

  Future<void> submit() async {
    if (state.shouldConfirmDuplicate) {
      emit(state.copyWith(shouldConfirmDuplicate: false));
    }

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

    final matches = await _repo.findMatching(
      firstName: state.firstName,
      lastName: state.lastName,
      motherName: state.motherName,
      fatherName: state.fatherName,
      birthDate: state.birthDate!,
    );
    final dup = matches.docs.where((d) => d.id != state.id).toList();
    if (dup.isNotEmpty) {
      emit(state.copyWith(shouldConfirmDuplicate: true));
      return;
    }

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

      examPassedGhaibi: state.examPassedGhaibi,
      examPassedNazari: state.examPassedNazari,
      examPassedHadith: state.examPassedHadith,
    );

    if (state.isEditing) {
      final res = await _repo.updateStudent(state.id, s);
      emit(state.copyWith(status: res));
    } else {
      final res = await _repo.createStudent(s);
      res.when(
        success: (newId) {
          emit(state.copyWith(id: newId));
          emit(state.copyWith(status: const Result.success(data: null)));
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
