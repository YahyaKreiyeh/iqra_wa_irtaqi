import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/localization/locale_keys.g.dart';
import 'package:iqra_wa_irtaqi/core/mixins/cubit_mixin.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/core/utilities/validators.dart';
import 'package:iqra_wa_irtaqi/features/authentication/cubits/login/login_state.dart';
import 'package:iqra_wa_irtaqi/features/authentication/models/authentication_dto.dart';
import 'package:iqra_wa_irtaqi/features/authentication/repositories/authentication_repository.dart';

class LoginCubit extends Cubit<LoginState> with SafeEmitter<LoginState> {
  final AuthenticationRepository _authenticationRepository;

  LoginCubit(this._authenticationRepository) : super(LoginState());

  Future<void> login() async {
    safeEmit(state.copyWith(status: const Result.loading()));

    final dto = AuthenticationDTO(email: state.email, password: state.password);
    final result = await _authenticationRepository.login(dto);

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

  String? _getErrorMessage(bool isValid, String errorMessage) =>
      isValid ? null : errorMessage;
}
