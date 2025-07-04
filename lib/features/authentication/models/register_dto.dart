import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_dto.freezed.dart';
part 'register_dto.g.dart';

@freezed
abstract class RegisterDTO with _$RegisterDTO {
  const factory RegisterDTO({required String email, required String password}) =
      _RegisterDTO;

  factory RegisterDTO.fromJson(Map<String, dynamic> json) =>
      _$RegisterDTOFromJson(json);
}
