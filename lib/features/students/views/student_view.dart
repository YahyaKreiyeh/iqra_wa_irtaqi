// lib/features/students/views/student_view.dart

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/extensions/dialog_extensions.dart';
import 'package:iqra_wa_irtaqi/core/localization/locale_keys.g.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/core/widgets/buttons/primary_button.dart';
import 'package:iqra_wa_irtaqi/core/widgets/text_fields/custom_text_field.dart';
import 'package:iqra_wa_irtaqi/features/students/cubits/student/student_cubit.dart';
import 'package:iqra_wa_irtaqi/features/students/cubits/student/student_state.dart';
import 'package:iqra_wa_irtaqi/features/students/models/student.dart';

class StudentView extends StatelessWidget {
  const StudentView({super.key});

  @override
  Widget build(BuildContext context) {
    final isEditing = context.select((StudentCubit c) => c.state.isEditing);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing
              ? LocaleKeys.edit_student.tr()
              : LocaleKeys.add_student.tr(),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _StudentBlocListener(),
            SizedBox(height: 24),
            _StudentForm(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _StudentBlocListener extends StatelessWidget {
  const _StudentBlocListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<StudentCubit, StudentState>(
      listenWhen: (p, c) =>
          p.status != c.status ||
          p.shouldConfirmDuplicate != c.shouldConfirmDuplicate,
      listener: (context, state) async {
        if (state.shouldConfirmDuplicate) {
          final ok = await context.showConfirmationDialog(
            title: LocaleKeys.duplicate_found.tr(),
            content: LocaleKeys.duplicate_student_confirmation.tr(),
            confirmText: LocaleKeys.yes.tr(),
            cancelText: LocaleKeys.no.tr(),
          );
          if (ok && context.mounted) {
            context.read<StudentCubit>().confirmDuplicateAndSubmit();
          }
          return;
        }
        state.status.when(
          success: (_) {
            final saved = Student(
              id: state.id,
              firstName: state.firstName,
              lastName: state.lastName,
              motherName: state.motherName,
              fatherName: state.fatherName,
              birthDate: state.birthDate!,
              nominatedGhaibi: state.nominatedGhaibi,
              nominatedNazari: state.nominatedNazari,
              nominatedHadith: state.nominatedHadith,
              examPassed: state.examPassed,
            );
            Navigator.of(context).pop(saved);
          },
          failure: (_, __, errMsg) {
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

class _StudentForm extends StatelessWidget {
  const _StudentForm();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<StudentCubit>().state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomTextField(
          initialValue: state.firstName,
          hintText: LocaleKeys.first_name.tr(),
          errorText: state.firstNameError != null
              ? LocaleKeys.required.tr()
              : null,
          onChanged: context.read<StudentCubit>().firstNameChanged,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          initialValue: state.lastName,
          hintText: LocaleKeys.last_name.tr(),
          errorText: state.lastNameError != null
              ? LocaleKeys.required.tr()
              : null,
          onChanged: context.read<StudentCubit>().lastNameChanged,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          initialValue: state.motherName,
          hintText: LocaleKeys.mother_name.tr(),
          errorText: state.motherNameError != null
              ? LocaleKeys.required.tr()
              : null,
          onChanged: context.read<StudentCubit>().motherNameChanged,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          initialValue: state.fatherName,
          hintText: LocaleKeys.father_name.tr(),
          errorText: state.fatherNameError != null
              ? LocaleKeys.required.tr()
              : null,
          onChanged: context.read<StudentCubit>().fatherNameChanged,
        ),
        const SizedBox(height: 16),
        InkWell(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              locale: context.locale,
              initialDate: state.birthDate ?? DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (picked != null && context.mounted) {
              context.read<StudentCubit>().birthDateChanged(picked);
            }
          },
          child: InputDecorator(
            decoration: InputDecoration(
              hintText: LocaleKeys.birthdate.tr(),
              errorText: state.birthDate == null
                  ? LocaleKeys.required.tr()
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              state.birthDate == null
                  ? LocaleKeys.birthdate.tr()
                  : DateFormat.yMMMd(
                      context.locale.toString(),
                    ).format(state.birthDate!),
            ),
          ),
        ),

        // Nominations
        const SizedBox(height: 24),
        CheckboxListTile(
          title: Text(LocaleKeys.nomination_ghaibi.tr()),
          value: state.nominatedGhaibi,
          onChanged: (v) =>
              context.read<StudentCubit>().nominatedGhaibiChanged(v!),
        ),
        CheckboxListTile(
          title: Text(LocaleKeys.nomination_nazari.tr()),
          value: state.nominatedNazari,
          onChanged: (v) =>
              context.read<StudentCubit>().nominatedNazariChanged(v!),
        ),
        CheckboxListTile(
          title: Text(LocaleKeys.nomination_hadith.tr()),
          value: state.nominatedHadith,
          onChanged: (v) =>
              context.read<StudentCubit>().nominatedHadithChanged(v!),
        ),

        // Exam status
        const SizedBox(height: 16),
        DropdownButtonFormField<bool?>(
          value: state.examPassed,
          decoration: InputDecoration(
            hintText: LocaleKeys.exam_status.tr(),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          items: [
            DropdownMenuItem(value: true, child: Text(LocaleKeys.passed.tr())),
            DropdownMenuItem(value: false, child: Text(LocaleKeys.failed.tr())),
          ],
          onChanged: context.read<StudentCubit>().examStatusChanged,
        ),

        const SizedBox(height: 24),
        PrimaryButton(
          text: LocaleKeys.save.tr(),
          loading: state.status.isLoading,
          onPressed: () {
            if (!state.status.isLoading) {
              context.read<StudentCubit>().submit();
            }
          },
        ),
      ],
    );
  }
}
