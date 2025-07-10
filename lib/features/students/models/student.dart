import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';
part 'student.g.dart';

@freezed
abstract class Student with _$Student {
  const factory Student({
    @Default('') String id,
    required String firstName,
    required String lastName,
    required String motherName,
    required String fatherName,
    required DateTime birthDate,

    @Default(false) bool nominatedGhaibi,
    @Default(false) bool nominatedNazari,
    @Default(false) bool nominatedHadith,

    bool? examPassedGhaibi,
    bool? examPassedNazari,
    bool? examPassedHadith,
  }) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
}
