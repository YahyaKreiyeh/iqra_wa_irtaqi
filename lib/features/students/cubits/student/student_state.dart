import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/features/institutes/models/institute.dart';

part 'student_state.freezed.dart';

@freezed
abstract class StudentState with _$StudentState {
  factory StudentState({
    @Default('') String id,
    @Default(false) bool isEditing,
    @Default('') String initialFirstName,
    @Default('') String initialLastName,
    @Default('') String initialMotherName,
    @Default('') String initialFatherName,
    DateTime? initialBirthDate,
    String? initialInstituteId,
    @Default('') String firstName,
    String? firstNameError,
    @Default('') String lastName,
    String? lastNameError,
    @Default('') String motherName,
    String? motherNameError,
    @Default('') String fatherName,
    String? fatherNameError,
    DateTime? birthDate,
    String? instituteId,
    @Default(Result<List<Institute>>.empty())
    Result<List<Institute>> institutesResult,
    @Default(false) bool nominatedGhaibi,
    @Default(false) bool nominatedNazari,
    @Default(false) bool nominatedHadith,
    bool? examPassedGhaibi,
    String? examGhaibiError,
    bool? examPassedNazari,
    String? examNazariError,
    bool? examPassedHadith,
    String? examHadithError,
    @Default(false) bool shouldConfirmDuplicate,
    @Default(Result.empty()) Result status,
  }) = _StudentState;
}
