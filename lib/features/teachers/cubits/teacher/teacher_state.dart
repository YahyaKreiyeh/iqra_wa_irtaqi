import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';

part 'teacher_state.freezed.dart';

@freezed
abstract class TeacherState with _$TeacherState {
  factory TeacherState({
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
    @Default(false) bool shouldConfirmDuplicate,
    @Default(Result.empty()) Result status,
  }) = _TeacherState;
}
