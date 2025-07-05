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
import 'package:iqra_wa_irtaqi/features/authentication/cubits/register/register_cubit.dart';
import 'package:iqra_wa_irtaqi/features/authentication/cubits/register/register_state.dart';
import 'package:iqra_wa_irtaqi/features/snackbar/bloc/snackbar_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.register.tr())),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _RegisterBlocListener(),
              const VerticalSpace(24),
              const _RegisterForm(),
              const VerticalSpace(16),
              _LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: '${LocaleKeys.already_have_an_account.tr()} ',
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

class _RegisterBlocListener extends StatelessWidget {
  const _RegisterBlocListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        state.status.when(
          success: (_) {
            context.read<SnackbarBloc>().add(
              AddSnackbarEvent(
                message: LocaleKeys.register_success.tr(),
                type: SnackbarType.success,
              ),
            );
          },
          failure: (_, _, errorMessage) {
            context.read<SnackbarBloc>().add(
              AddSnackbarEvent(
                message: errorMessage ?? LocaleKeys.register_error.tr(),
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

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _EmailInput(),
        VerticalSpace(16),
        _PasswordInput(),
        VerticalSpace(16),
        _ConfirmPasswordInput(),
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
    final error = context.select((RegisterCubit c) => c.state.emailError);
    return CustomTextField(
      hintText: LocaleKeys.email.tr(),
      errorText: error,
      onChanged: context.read<RegisterCubit>().emailChanged,
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    final error = context.select((RegisterCubit c) => c.state.passwordError);
    return CustomTextField(
      hintText: LocaleKeys.password.tr(),
      obscureText: true,
      errorText: error,
      onChanged: context.read<RegisterCubit>().passwordChanged,
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  const _ConfirmPasswordInput();

  @override
  Widget build(BuildContext context) {
    final error = context.select(
      (RegisterCubit c) => c.state.confirmedPasswordError,
    );
    return CustomTextField(
      hintText: LocaleKeys.confirm_password.tr(),
      obscureText: true,
      errorText: error,
      onChanged: context.read<RegisterCubit>().confirmPasswordChanged,
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (RegisterCubit c) => c.state.status.isLoading,
    );
    final emailError = context.select((RegisterCubit c) => c.state.emailError);
    final passwordError = context.select(
      (RegisterCubit c) => c.state.passwordError,
    );
    final confirmedPasswordError = context.select(
      (RegisterCubit c) => c.state.confirmedPasswordError,
    );
    final email = context.select((RegisterCubit c) => c.state.email);
    final password = context.select((RegisterCubit c) => c.state.password);
    final confirmedPassword = context.select(
      (RegisterCubit c) => c.state.confirmedPassword,
    );

    final hasError =
        emailError != null ||
        passwordError != null ||
        confirmedPasswordError != null;

    final hasEmptyField =
        email.isEmpty || password.isEmpty || confirmedPassword.isEmpty;

    final canSubmit = !isLoading && !hasError && !hasEmptyField;

    return PrimaryButton(
      text: LocaleKeys.register.tr(),
      loading: isLoading,
      onPressed: canSubmit
          ? () => context.read<RegisterCubit>().register()
          : null,
    );
  }
}
