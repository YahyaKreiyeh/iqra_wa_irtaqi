// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Teacher _$TeacherFromJson(Map<String, dynamic> json) => _Teacher(
  id: json['id'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  motherName: json['motherName'] as String,
  fatherName: json['fatherName'] as String,
  birthDate: DateTime.parse(json['birthDate'] as String),
);

Map<String, dynamic> _$TeacherToJson(_Teacher instance) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'motherName': instance.motherName,
  'fatherName': instance.fatherName,
  'birthDate': instance.birthDate.toIso8601String(),
};
