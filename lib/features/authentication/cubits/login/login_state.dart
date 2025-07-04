import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  factory LoginState({
    @Default(Result.empty()) Result status,
    @Default('') String email,
    @Default(null) String? emailError,
    @Default('') String password,
    @Default(null) String? passwordError,
  }) = _LoginState;
}
