import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/extensions/dialog_extensions.dart';
import 'package:iqra_wa_irtaqi/core/localization/locale_keys.g.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/core/routing/routes_extension.dart';
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
      listenWhen: (prev, cur) =>
          prev.status != cur.status ||
          prev.shouldConfirmDuplicate != cur.shouldConfirmDuplicate,
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
              examPassedGhaibi: state.examPassedGhaibi,
              examPassedNazari: state.examPassedNazari,
              examPassedHadith: state.examPassedHadith,
            );
            context.pop(saved);
          },
          failure: (_, _, msg) {
            context.showErrorDialog(
              title: LocaleKeys.save_error.tr(),
              content: msg ?? LocaleKeys.save_error.tr(),
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
    final s = context.watch<StudentCubit>().state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomTextField(
          initialValue: s.firstName,
          hintText: LocaleKeys.first_name.tr(),
          errorText: s.firstNameError != null ? LocaleKeys.required.tr() : null,
          onChanged: context.read<StudentCubit>().firstNameChanged,
        ),
        const SizedBox(height: 16),

        CustomTextField(
          initialValue: s.lastName,
          hintText: LocaleKeys.last_name.tr(),
          errorText: s.lastNameError != null ? LocaleKeys.required.tr() : null,
          onChanged: context.read<StudentCubit>().lastNameChanged,
        ),
        const SizedBox(height: 16),

        CustomTextField(
          initialValue: s.motherName,
          hintText: LocaleKeys.mother_name.tr(),
          errorText: s.motherNameError != null
              ? LocaleKeys.required.tr()
              : null,
          onChanged: context.read<StudentCubit>().motherNameChanged,
        ),
        const SizedBox(height: 16),

        CustomTextField(
          initialValue: s.fatherName,
          hintText: LocaleKeys.father_name.tr(),
          errorText: s.fatherNameError != null
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
              initialDate: s.birthDate ?? DateTime.now(),
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
              errorText: s.birthDate == null ? LocaleKeys.required.tr() : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              s.birthDate == null
                  ? LocaleKeys.birthdate.tr()
                  : DateFormat.yMMMd(
                      context.locale.toString(),
                    ).format(s.birthDate!),
            ),
          ),
        ),
        const SizedBox(height: 24),
        _InstituteInput(),
        const SizedBox(height: 24),

        CheckboxListTile(
          title: Text(LocaleKeys.nomination_ghaibi.tr()),
          value: s.nominatedGhaibi,
          onChanged: (v) =>
              context.read<StudentCubit>().nominatedGhaibiChanged(v!),
        ),
        if (s.nominatedGhaibi) ...[
          DropdownButtonFormField<bool>(
            value: s.examPassedGhaibi,
            decoration: InputDecoration(
              hintText: LocaleKeys.exam_status.tr(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items: [
              DropdownMenuItem(
                value: true,
                child: Text(LocaleKeys.passed.tr()),
              ),
              DropdownMenuItem(
                value: false,
                child: Text(LocaleKeys.failed.tr()),
              ),
            ],
            onChanged: context.read<StudentCubit>().examGhaibiStatusChanged,
          ),
          const SizedBox(height: 16),
        ],

        CheckboxListTile(
          title: Text(LocaleKeys.nomination_nazari.tr()),
          value: s.nominatedNazari,
          onChanged: (v) =>
              context.read<StudentCubit>().nominatedNazariChanged(v!),
        ),
        if (s.nominatedNazari) ...[
          DropdownButtonFormField<bool>(
            value: s.examPassedNazari,
            decoration: InputDecoration(
              hintText: LocaleKeys.exam_status.tr(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items: [
              DropdownMenuItem(
                value: true,
                child: Text(LocaleKeys.passed.tr()),
              ),
              DropdownMenuItem(
                value: false,
                child: Text(LocaleKeys.failed.tr()),
              ),
            ],
            onChanged: context.read<StudentCubit>().examNazariStatusChanged,
          ),
          const SizedBox(height: 16),
        ],

        CheckboxListTile(
          title: Text(LocaleKeys.nomination_hadith.tr()),
          value: s.nominatedHadith,
          onChanged: (v) =>
              context.read<StudentCubit>().nominatedHadithChanged(v!),
        ),
        if (s.nominatedHadith) ...[
          DropdownButtonFormField<bool>(
            value: s.examPassedHadith,
            decoration: InputDecoration(
              hintText: LocaleKeys.exam_status.tr(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            items: [
              DropdownMenuItem(
                value: true,
                child: Text(LocaleKeys.passed.tr()),
              ),
              DropdownMenuItem(
                value: false,
                child: Text(LocaleKeys.failed.tr()),
              ),
            ],
            onChanged: context.read<StudentCubit>().examHadithStatusChanged,
          ),
          const SizedBox(height: 16),
        ],

        PrimaryButton(
          text: LocaleKeys.save.tr(),
          loading: s.status.isLoading,
          onPressed: s.status.isLoading
              ? null
              : () => context.read<StudentCubit>().submit(),
        ),
      ],
    );
  }
}

class _InstituteInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final res = context.watch<StudentCubit>().state.institutesResult;
    return res.when(
      empty: () => const SizedBox.shrink(),
      loading: () => const Center(child: CircularProgressIndicator()),
      failure: (_, _, msg) => Text(
        msg ?? LocaleKeys.firebase_generic_error.tr(),
        style: const TextStyle(color: Colors.red),
      ),
      success: (list) {
        final sel = context.watch<StudentCubit>().state.instituteId;
        final items = <DropdownMenuItem<String?>>[
          DropdownMenuItem(value: null, child: Text(LocaleKeys.institute.tr())),
          for (var i in list)
            DropdownMenuItem(value: i.id, child: Text(i.name)),
        ];
        return DropdownButtonFormField<String?>(
          value: sel,
          decoration: InputDecoration(
            hintText: LocaleKeys.institute.tr(),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          items: items,
          onChanged: context.read<StudentCubit>().instituteChanged,
        );
      },
    );
  }
}
