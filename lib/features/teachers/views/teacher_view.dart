import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/extensions/dialog_extensions.dart';
import 'package:iqra_wa_irtaqi/core/localization/locale_keys.g.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/core/widgets/buttons/primary_button.dart';
import 'package:iqra_wa_irtaqi/core/widgets/text_fields/custom_text_field.dart';
import 'package:iqra_wa_irtaqi/features/teachers/cubits/teacher/teacher_cubit.dart';
import 'package:iqra_wa_irtaqi/features/teachers/cubits/teacher/teacher_state.dart';
import 'package:iqra_wa_irtaqi/features/teachers/models/teacher.dart';

class TeacherView extends StatelessWidget {
  const TeacherView({super.key});

  @override
  Widget build(BuildContext context) {
    final isEditing = context.select((TeacherCubit c) => c.state.isEditing);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing
              ? LocaleKeys.edit_teacher.tr()
              : LocaleKeys.add_teacher.tr(),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _TeacherBlocListener(),
            SizedBox(height: 24),
            _TeacherForm(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _TeacherBlocListener extends StatelessWidget {
  const _TeacherBlocListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<TeacherCubit, TeacherState>(
      listenWhen: (p, c) =>
          p.status != c.status ||
          p.shouldConfirmDuplicate != c.shouldConfirmDuplicate,
      listener: (context, state) async {
        if (state.shouldConfirmDuplicate) {
          final ok = await context.showConfirmationDialog(
            title: LocaleKeys.duplicate_found.tr(),
            content: LocaleKeys.duplicate_teacher_confirmation.tr(),
            confirmText: LocaleKeys.yes.tr(),
            cancelText: LocaleKeys.no.tr(),
          );
          if (ok && context.mounted) {
            context.read<TeacherCubit>().confirmDuplicateAndSubmit();
          }
          return;
        }
        state.status.when(
          success: (_) {
            final saved = Teacher(
              id: state.id,
              firstName: state.firstName,
              lastName: state.lastName,
              motherName: state.motherName,
              fatherName: state.fatherName,
              birthDate: state.birthDate!,
            );
            Navigator.of(context).pop(saved);
          },
          failure: (_, _, errMsg) {
            context.showErrorDialog(
              title: LocaleKeys.save_error.tr(),
              content: errMsg ?? LocaleKeys.save_error.tr(),
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

class _TeacherForm extends StatelessWidget {
  const _TeacherForm();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _FirstNameInput(),
        SizedBox(height: 16),
        _LastNameInput(),
        SizedBox(height: 16),
        _MotherNameInput(),
        SizedBox(height: 16),
        _FatherNameInput(),
        SizedBox(height: 16),
        _BirthDateInput(),
        SizedBox(height: 24),
        _SubmitButton(),
      ],
    );
  }
}

class _FirstNameInput extends StatelessWidget {
  const _FirstNameInput();

  @override
  Widget build(BuildContext context) {
    final firstName = context.select((TeacherCubit c) => c.state.firstName);
    final error = context.select((TeacherCubit c) => c.state.firstNameError);
    return CustomTextField(
      initialValue: firstName,
      hintText: LocaleKeys.first_name.tr(),
      errorText: error != null ? LocaleKeys.required.tr() : null,
      onChanged: context.read<TeacherCubit>().firstNameChanged,
    );
  }
}

class _LastNameInput extends StatelessWidget {
  const _LastNameInput();

  @override
  Widget build(BuildContext context) {
    final lastName = context.select((TeacherCubit c) => c.state.lastName);
    final error = context.select((TeacherCubit c) => c.state.lastNameError);
    return CustomTextField(
      initialValue: lastName,
      hintText: LocaleKeys.last_name.tr(),
      errorText: error != null ? LocaleKeys.required.tr() : null,
      onChanged: context.read<TeacherCubit>().lastNameChanged,
    );
  }
}

class _MotherNameInput extends StatelessWidget {
  const _MotherNameInput();

  @override
  Widget build(BuildContext context) {
    final motherName = context.select((TeacherCubit c) => c.state.motherName);
    final error = context.select((TeacherCubit c) => c.state.motherNameError);
    return CustomTextField(
      initialValue: motherName,
      hintText: LocaleKeys.mother_name.tr(),
      errorText: error != null ? LocaleKeys.required.tr() : null,
      onChanged: context.read<TeacherCubit>().motherNameChanged,
    );
  }
}

class _FatherNameInput extends StatelessWidget {
  const _FatherNameInput();

  @override
  Widget build(BuildContext context) {
    final fatherName = context.select((TeacherCubit c) => c.state.fatherName);
    final error = context.select((TeacherCubit c) => c.state.fatherNameError);
    return CustomTextField(
      initialValue: fatherName,
      hintText: LocaleKeys.father_name.tr(),
      errorText: error != null ? LocaleKeys.required.tr() : null,
      onChanged: context.read<TeacherCubit>().fatherNameChanged,
    );
  }
}

class _BirthDateInput extends StatelessWidget {
  const _BirthDateInput();

  @override
  Widget build(BuildContext context) {
    final birthDate = context.select((TeacherCubit c) => c.state.birthDate);
    final formatted = birthDate != null
        ? DateFormat.yMMMd(context.locale.toString()).format(birthDate)
        : '';

    return InkWell(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          locale: context.locale,
          initialDate: birthDate ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (picked != null && context.mounted) {
          context.read<TeacherCubit>().birthDateChanged(picked);
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          hintText: LocaleKeys.birthdate.tr(),
          errorText: context.select(
            (TeacherCubit c) =>
                c.state.birthDate == null ? LocaleKeys.required.tr() : null,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(formatted.isEmpty ? LocaleKeys.birthdate.tr() : formatted),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    final state = context.select((TeacherCubit c) => c.state);
    final canSubmit =
        !state.status.isLoading &&
        state.firstName.isNotEmpty &&
        state.lastName.isNotEmpty &&
        state.motherName.isNotEmpty &&
        state.fatherName.isNotEmpty &&
        state.birthDate != null;

    return PrimaryButton(
      text: LocaleKeys.save.tr(),
      loading: state.status.isLoading,
      onPressed: canSubmit ? () => context.read<TeacherCubit>().submit() : null,
    );
  }
}
