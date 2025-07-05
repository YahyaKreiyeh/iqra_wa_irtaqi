import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/constants/constants.dart';
import 'package:iqra_wa_irtaqi/core/constants/enums.dart';
import 'package:iqra_wa_irtaqi/core/helpers/spacing.dart';
import 'package:iqra_wa_irtaqi/core/localization/locale_keys.g.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/core/routing/routes.dart';
import 'package:iqra_wa_irtaqi/core/routing/routes_extension.dart';
import 'package:iqra_wa_irtaqi/core/widgets/buttons/primary_button.dart';
import 'package:iqra_wa_irtaqi/core/widgets/text_fields/custom_text_field.dart';
import 'package:iqra_wa_irtaqi/features/authentication/cubits/password_reset/password_reset_cubit.dart';
import 'package:iqra_wa_irtaqi/features/authentication/cubits/password_reset/password_reset_state.dart';
import 'package:iqra_wa_irtaqi/features/snackbar/bloc/snackbar_bloc.dart';

class PasswordResetView extends StatelessWidget {
  const PasswordResetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.forgot_password.tr())),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _PasswordResetBlocListener(),
              const VerticalSpace(24),
              const _EmailInput(),
              const VerticalSpace(24),
              const _SubmitButton(),
              const VerticalSpace(16),
              _BackToLoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _PasswordResetBlocListener extends StatelessWidget {
  const _PasswordResetBlocListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PasswordResetCubit, PasswordResetState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        state.status.when(
          success: (_) {
            context.read<SnackbarBloc>().add(
              AddSnackbarEvent(
                message: LocaleKeys.reset_password_email_sent.tr(),
                type: SnackbarType.success,
              ),
            );
            Navigator.of(context).pop();
          },
          failure: (_, _, errorMessage) {
            context.read<SnackbarBloc>().add(
              AddSnackbarEvent(
                message: errorMessage ?? LocaleKeys.reset_password_error.tr(),
                type: SnackbarType.error,
              ),
            );
          },
          loading: () {},
          empty: () {},
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    final error = context.select((PasswordResetCubit c) => c.state.emailError);
    return CustomTextField(
      hintText: LocaleKeys.email.tr(),
      errorText: error,
      onChanged: context.read<PasswordResetCubit>().emailChanged,
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (PasswordResetCubit c) => c.state.status.isLoading,
    );
    final emailError = context.select(
      (PasswordResetCubit c) => c.state.emailError,
    );
    final email = context.select((PasswordResetCubit c) => c.state.email);
    final canSubmit = !isLoading && emailError == null && email.isNotEmpty;

    return PrimaryButton(
      text: LocaleKeys.reset_password.tr(),
      loading: isLoading,
      onPressed: canSubmit
          ? () => context.read<PasswordResetCubit>().submit()
          : null,
    );
  }
}

class _BackToLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: '${LocaleKeys.back_to_login.tr()} ',
          style: Theme.of(context).textTheme.bodyMedium,
          children: [
            TextSpan(
              text: LocaleKeys.login.tr(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).primaryColor,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushReplacementNamed(Routes.loginView);
                },
            ),
          ],
        ),
      ),
    );
  }
}
