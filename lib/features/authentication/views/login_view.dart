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
import 'package:iqra_wa_irtaqi/features/authentication/cubits/login/login_cubit.dart';
import 'package:iqra_wa_irtaqi/features/authentication/cubits/login/login_state.dart';
import 'package:iqra_wa_irtaqi/features/snackbar/bloc/snackbar_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.login.tr())),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _LoginBlocListener(),
              const VerticalSpace(24),
              const _LoginForm(),
              const VerticalSpace(16),
              _RegisterButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: '${LocaleKeys.dont_have_an_account.tr()} ',
          style: Theme.of(context).textTheme.bodyMedium,
          children: [
            TextSpan(
              text: LocaleKeys.register.tr(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).primaryColor,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushReplacementNamed(Routes.registerView);
                },
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginBlocListener extends StatelessWidget {
  const _LoginBlocListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        state.status.when(
          success: (_) {
            context.read<SnackbarBloc>().add(
              AddSnackbarEvent(
                message: LocaleKeys.login_success.tr(),
                type: SnackbarType.success,
              ),
            );
            context.pushReplacementNamed(Routes.homeView);
          },
          failure: (_, _, errorMessage) {
            context.read<SnackbarBloc>().add(
              AddSnackbarEvent(
                message: errorMessage ?? LocaleKeys.login_error.tr(),
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

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _EmailInput(),
        VerticalSpace(16),
        _PasswordInput(),
        VerticalSpace(8),
        _ForgotPasswordButton(),
        VerticalSpace(24),
        _SubmitButton(),
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    final error = context.select((LoginCubit c) => c.state.emailError);
    return CustomTextField(
      hintText: LocaleKeys.email.tr(),
      errorText: error,
      onChanged: context.read<LoginCubit>().emailChanged,
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    final error = context.select((LoginCubit c) => c.state.passwordError);
    return CustomTextField(
      hintText: LocaleKeys.password.tr(),
      obscureText: true,
      errorText: error,
      onChanged: context.read<LoginCubit>().passwordChanged,
    );
  }
}

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => context.pushNamed(Routes.passwordResetView),
        child: Text(
          LocaleKeys.forgot_password.tr(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (LoginCubit c) => c.state.status.isLoading,
    );
    final emailError = context.select((LoginCubit c) => c.state.emailError);
    final passwordError = context.select(
      (LoginCubit c) => c.state.passwordError,
    );
    final email = context.select((LoginCubit c) => c.state.email);
    final password = context.select((LoginCubit c) => c.state.password);

    final hasError = emailError != null || passwordError != null;
    final hasEmptyField = email.isEmpty || password.isEmpty;
    final canSubmit = !isLoading && !hasError && !hasEmptyField;

    return PrimaryButton(
      text: LocaleKeys.login.tr(),
      loading: isLoading,
      onPressed: canSubmit ? () => context.read<LoginCubit>().login() : null,
    );
  }
}
