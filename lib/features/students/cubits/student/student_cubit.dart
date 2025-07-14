import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/mixins/cubit_mixin.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/features/institutes/models/institute.dart';
import 'package:iqra_wa_irtaqi/features/institutes/repositories/institutes_repository.dart';
import 'package:iqra_wa_irtaqi/features/students/cubits/student/student_state.dart';
import 'package:iqra_wa_irtaqi/features/students/models/student.dart';
import 'package:iqra_wa_irtaqi/features/students/repositories/students_repository.dart';

class StudentCubit extends Cubit<StudentState> with SafeEmitter<StudentState> {
  final StudentsRepository _repo;
  final InstitutesRepository _institutesRepo;
  StudentCubit(this._repo, this._institutesRepo) : super(StudentState());

  Future<void> initialize({Student? initial, Institute? preselected}) async {
    if (initial != null) {
      final editing = initial.id.isNotEmpty;
      safeEmit(
        state.copyWith(
          id: initial.id,
          isEditing: editing,
          initialFirstName: initial.firstName,
          initialLastName: initial.lastName,
          initialMotherName: initial.motherName,
          initialFatherName: initial.fatherName,
          initialBirthDate: initial.birthDate,
          initialInstituteId: initial.instituteId,
          firstName: initial.firstName,
          lastName: initial.lastName,
          motherName: initial.motherName,
          fatherName: initial.fatherName,
          birthDate: initial.birthDate,
          instituteId: initial.instituteId,
          nominatedGhaibi: initial.nominatedGhaibi,
          nominatedNazari: initial.nominatedNazari,
          nominatedHadith: initial.nominatedHadith,
          examPassedGhaibi: initial.examPassedGhaibi,
          examPassedNazari: initial.examPassedNazari,
          examPassedHadith: initial.examPassedHadith,
        ),
      );
    } else if (preselected != null) {
      safeEmit(
        state.copyWith(
          initialInstituteId: preselected.id,
          instituteId: preselected.id,
        ),
      );
    }

    safeEmit(state.copyWith(institutesResult: const Result.loading()));
    try {
      final snap = await _institutesRepo.fetchInstitutes(limit: 1000);
      final list = snap.docs
          .map((d) => Institute.fromJson(d.data()).copyWith(id: d.id))
          .toList();
      safeEmit(state.copyWith(institutesResult: Result.success(data: list)));
    } catch (e) {
      safeEmit(
        state.copyWith(
          institutesResult: Result.failure(
            error: Exception(e),
            data: null,
            errorMessage: e.toString(),
          ),
        ),
      );
    }
  }

  void firstNameChanged(String v) => safeEmit(
    state.copyWith(
      firstName: v,
      firstNameError: v.isNotEmpty ? null : 'required',
    ),
  );
  void lastNameChanged(String v) => safeEmit(
    state.copyWith(
      lastName: v,
      lastNameError: v.isNotEmpty ? null : 'required',
    ),
  );
  void motherNameChanged(String v) => safeEmit(
    state.copyWith(
      motherName: v,
      motherNameError: v.isNotEmpty ? null : 'required',
    ),
  );
  void fatherNameChanged(String v) => safeEmit(
    state.copyWith(
      fatherName: v,
      fatherNameError: v.isNotEmpty ? null : 'required',
    ),
  );
  void instituteChanged(String? id) =>
      safeEmit(state.copyWith(instituteId: id));
  void birthDateChanged(DateTime d) => safeEmit(state.copyWith(birthDate: d));

  void nominatedGhaibiChanged(bool v) =>
      safeEmit(state.copyWith(nominatedGhaibi: v));
  void nominatedNazariChanged(bool v) =>
      safeEmit(state.copyWith(nominatedNazari: v));
  void nominatedHadithChanged(bool v) =>
      safeEmit(state.copyWith(nominatedHadith: v));

  void examGhaibiStatusChanged(bool? v) =>
      safeEmit(state.copyWith(examPassedGhaibi: v, examGhaibiError: null));
  void examNazariStatusChanged(bool? v) =>
      safeEmit(state.copyWith(examPassedNazari: v, examNazariError: null));
  void examHadithStatusChanged(bool? v) =>
      safeEmit(state.copyWith(examPassedHadith: v, examHadithError: null));

  Future<void> submit() async {
    if (state.shouldConfirmDuplicate) {
      safeEmit(state.copyWith(shouldConfirmDuplicate: false));
    }

    final fnErr = state.firstName.isEmpty ? 'required' : null;
    final lnErr = state.lastName.isEmpty ? 'required' : null;
    final mnErr = state.motherName.isEmpty ? 'required' : null;
    final faErr = state.fatherName.isEmpty ? 'required' : null;
    final bdErr = state.birthDate == null ? 'required' : null;

    if ([fnErr, lnErr, mnErr, faErr, bdErr].any((e) => e != null)) {
      safeEmit(
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
      safeEmit(state.copyWith(shouldConfirmDuplicate: true));
      return;
    }

    _performSave();
  }

  void confirmDuplicateAndSubmit() {
    safeEmit(state.copyWith(shouldConfirmDuplicate: false));
    _performSave();
  }

  void _performSave() async {
    safeEmit(state.copyWith(status: const Result.loading()));

    final s = Student(
      id: state.id,
      firstName: state.firstName,
      lastName: state.lastName,
      motherName: state.motherName,
      fatherName: state.fatherName,
      birthDate: state.birthDate!,
      instituteId: state.instituteId,
      nominatedGhaibi: state.nominatedGhaibi,
      nominatedNazari: state.nominatedNazari,
      nominatedHadith: state.nominatedHadith,
      examPassedGhaibi: state.examPassedGhaibi,
      examPassedNazari: state.examPassedNazari,
      examPassedHadith: state.examPassedHadith,
    );

    if (state.isEditing) {
      final res = await _repo.updateStudent(state.id, s);
      safeEmit(state.copyWith(status: res));
    } else {
      final res = await _repo.createStudent(s);
      res.when(
        success: (newId) => safeEmit(
          state.copyWith(status: const Result.success(data: null), id: newId),
        ),
        failure: (err, _, msg) => safeEmit(
          state.copyWith(
            status: Result.failure(error: err, data: null, errorMessage: msg),
          ),
        ),
        loading: () {},
        empty: () {},
      );
    }
  }
}
