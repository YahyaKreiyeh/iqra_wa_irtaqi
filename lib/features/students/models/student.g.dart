// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Student _$StudentFromJson(Map<String, dynamic> json) => _Student(
  id: json['id'] as String? ?? '',
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  motherName: json['motherName'] as String,
  fatherName: json['fatherName'] as String,
  birthDate: DateTime.parse(json['birthDate'] as String),
  nominatedGhaibi: json['nominatedGhaibi'] as bool? ?? false,
  nominatedNazari: json['nominatedNazari'] as bool? ?? false,
  nominatedHadith: json['nominatedHadith'] as bool? ?? false,
  examPassed: json['examPassed'] as bool?,
);

Map<String, dynamic> _$StudentToJson(_Student instance) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'motherName': instance.motherName,
  'fatherName': instance.fatherName,
  'birthDate': instance.birthDate.toIso8601String(),
  'nominatedGhaibi': instance.nominatedGhaibi,
  'nominatedNazari': instance.nominatedNazari,
  'nominatedHadith': instance.nominatedHadith,
  'examPassed': instance.examPassed,
};
