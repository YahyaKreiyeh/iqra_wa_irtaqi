// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institute.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Institute _$InstituteFromJson(Map<String, dynamic> json) => _Institute(
  id: json['id'] as String,
  name: json['name'] as String,
  location: json['location'] as String,
  notes: json['notes'] as String?,
  managerId: json['managerId'] as String?,
  centerId: json['centerId'] as String?,
);

Map<String, dynamic> _$InstituteToJson(_Institute instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'notes': instance.notes,
      'managerId': instance.managerId,
      'centerId': instance.centerId,
    };
