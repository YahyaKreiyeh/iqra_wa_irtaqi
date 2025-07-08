import 'package:freezed_annotation/freezed_annotation.dart';

part 'teacher.freezed.dart';
part 'teacher.g.dart';

@freezed
abstract class Teacher with _$Teacher {
  const factory Teacher({
    required String id,
    required String firstName,
    required String lastName,
    required String motherName,
    required String fatherName,
    required DateTime birthDate,
  }) = _Teacher;

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);
}
