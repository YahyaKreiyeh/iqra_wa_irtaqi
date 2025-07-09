import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';

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
    @Default('') String firstName,
    String? firstNameError,
    @Default('') String lastName,
    String? lastNameError,
    @Default('') String motherName,
    String? motherNameError,
    @Default('') String fatherName,
    String? fatherNameError,
    DateTime? birthDate,
    @Default(false) bool nominatedGhaibi,
    @Default(false) bool nominatedNazari,
    @Default(false) bool nominatedHadith,
    bool? examPassed,
    @Default(false) bool shouldConfirmDuplicate,
    @Default(Result.empty()) Result status,
  }) = _StudentState;
}
