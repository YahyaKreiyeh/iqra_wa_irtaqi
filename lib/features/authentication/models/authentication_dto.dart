import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_dto.freezed.dart';
part 'authentication_dto.g.dart';

@freezed
abstract class AuthenticationDTO with _$AuthenticationDTO {
  const factory AuthenticationDTO({
    required String email,
    required String password,
  }) = _AuthenticationDTO;

  factory AuthenticationDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationDTOFromJson(json);
}
