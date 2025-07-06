// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthenticationDTO _$AuthenticationDTOFromJson(Map<String, dynamic> json) =>
    _AuthenticationDTO(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AuthenticationDTOToJson(_AuthenticationDTO instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};
