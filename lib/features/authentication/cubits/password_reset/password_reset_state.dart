import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';

part 'password_reset_state.freezed.dart';

@freezed
abstract class PasswordResetState with _$PasswordResetState {
  factory PasswordResetState({
    @Default(Result.empty()) Result status,
    @Default('') String email,
    @Default(null) String? emailError,
  }) = _PasswordResetState;
}
