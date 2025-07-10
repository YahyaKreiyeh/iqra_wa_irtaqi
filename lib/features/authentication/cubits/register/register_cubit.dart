import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/localization/locale_keys.g.dart';
import 'package:iqra_wa_irtaqi/core/mixins/cubit_mixin.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/core/utilities/validators.dart';
import 'package:iqra_wa_irtaqi/features/authentication/cubits/register/register_state.dart';
import 'package:iqra_wa_irtaqi/features/authentication/models/authentication_dto.dart';
import 'package:iqra_wa_irtaqi/features/authentication/repositories/authentication_repository.dart';

class RegisterCubit extends Cubit<RegisterState>
    with SafeEmitter<RegisterState> {
  final AuthenticationRepository _authenticationRepository;
  RegisterCubit(this._authenticationRepository) : super(RegisterState());

  Future<void> register() async {
    safeEmit(state.copyWith(status: const Result.loading()));

    final dto = AuthenticationDTO(email: state.email, password: state.password);
    final result = await _authenticationRepository.register(dto);

    result.when(
      success: (credential) {
        safeEmit(state.copyWith(status: Result.success(data: credential)));
      },
      failure: (error, _, errorMessage) {
        safeEmit(
          state.copyWith(
            status: Result.failure(
              error: error,
              data: null,
              errorMessage: errorMessage,
            ),
          ),
        );
      },
      loading: () {
        safeEmit(state.copyWith(status: const Result.loading()));
      },
      empty: () {},
    );
  }

  void emailChanged(String val) => safeEmit(
    state.copyWith(
      email: val,
      emailError: _getErrorMessage(
        validateEmail(val),
        LocaleKeys.email_error_message.tr(),
      ),
    ),
  );

  void passwordChanged(String val) => safeEmit(
    state.copyWith(
      password: val,
      passwordError: _getErrorMessage(
        val.isNotEmpty,
        LocaleKeys.password_error_message.tr(),
      ),
    ),
  );

  void confirmPasswordChanged(String val) => safeEmit(
    state.copyWith(
      confirmedPassword: val,
      confirmedPasswordError: _getErrorMessage(
        state.password == val,
        LocaleKeys.passwords_do_not_match_error_message.tr(),
      ),
    ),
  );

  String? _getErrorMessage(bool isValid, String errorMessage) =>
      isValid ? null : errorMessage;
}
