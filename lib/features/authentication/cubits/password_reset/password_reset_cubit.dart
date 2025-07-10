import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/localization/locale_keys.g.dart';
import 'package:iqra_wa_irtaqi/core/mixins/cubit_mixin.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/core/utilities/validators.dart';
import 'package:iqra_wa_irtaqi/features/authentication/cubits/password_reset/password_reset_state.dart';
import 'package:iqra_wa_irtaqi/features/authentication/repositories/authentication_repository.dart';

class PasswordResetCubit extends Cubit<PasswordResetState>
    with SafeEmitter<PasswordResetState> {
  final AuthenticationRepository _repo;
  PasswordResetCubit(this._repo) : super(PasswordResetState());

  Future<void> submit() async {
    safeEmit(state.copyWith(status: const Result.loading()));
    final result = await _repo.resetPassword(state.email);
    result.when(
      success: (_) =>
          safeEmit(state.copyWith(status: const Result.success(data: null))),
      failure: (err, _, msg) => safeEmit(
        state.copyWith(
          status: Result.failure(error: err, data: null, errorMessage: msg),
        ),
      ),
      loading: () {
        safeEmit(state.copyWith(status: const Result.loading()));
      },
      empty: () {},
    );
  }

  void emailChanged(String email) {
    safeEmit(
      state.copyWith(
        email: email,
        emailError: validateEmail(email)
            ? null
            : LocaleKeys.email_error_message.tr(),
      ),
    );
  }
}
