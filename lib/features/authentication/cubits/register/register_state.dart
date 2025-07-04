import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';

part 'register_state.freezed.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  factory RegisterState({
    @Default(Result.empty()) Result status,
    @Default('') String email,
    @Default(null) String? emailError,
    @Default('') String password,
    @Default(null) String? passwordError,
    @Default('') String confirmedPassword,
    @Default(null) String? confirmedPasswordError,
  }) = _RegisterState;
}
