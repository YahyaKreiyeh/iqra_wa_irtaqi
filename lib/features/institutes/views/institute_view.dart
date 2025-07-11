import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/constants/constants.dart';
import 'package:iqra_wa_irtaqi/core/helpers/spacing.dart';
import 'package:iqra_wa_irtaqi/core/localization/locale_keys.g.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/core/widgets/buttons/primary_button.dart';
import 'package:iqra_wa_irtaqi/core/widgets/text_fields/custom_text_field.dart';
import 'package:iqra_wa_irtaqi/features/institutes/cubits/institute/institute_cubit.dart';
import 'package:iqra_wa_irtaqi/features/institutes/cubits/institute/institute_state.dart';
import 'package:iqra_wa_irtaqi/features/institutes/models/institute.dart'
    as ins;

class InstituteView extends StatelessWidget {
  const InstituteView({super.key});

  @override
  Widget build(BuildContext context) {
    final isEditing = context.select((InstituteCubit c) => c.state.isEditing);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing
              ? LocaleKeys.edit_institute.tr()
              : LocaleKeys.add_institute.tr(),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _InstituteListener(),
            VerticalSpace(24),
            _InstituteForm(),
            VerticalSpace(16),
          ],
        ),
      ),
    );
  }
}

class _InstituteListener extends StatelessWidget {
  const _InstituteListener();
  @override
  Widget build(BuildContext context) {
    return BlocListener<InstituteCubit, InstituteState>(
      listenWhen: (p, c) => p.status != c.status,
      listener: (ctx, state) => state.status.when(
        success: (_) {
          final saved = ins.Institute(
            id: state.id,
            name: state.name,
            location: state.location,
            notes: state.notes.isEmpty ? null : state.notes,
            managerId: state.managerId,
            centerId: state.centerId,
          );
          Navigator.of(ctx).pop(saved);
          return null;
        },
        failure: (_, _, _) {
          return null;
        },
        loading: () {
          return null;
        },
        empty: () {
          return null;
        },
      ),
      child: const SizedBox.shrink(),
    );
  }
}

class _InstituteForm extends StatelessWidget {
  const _InstituteForm();
  @override
  Widget build(BuildContext context) {
    final state = context.watch<InstituteCubit>().state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomTextField(
          initialValue: state.name,
          hintText: LocaleKeys.name.tr(),
          errorText: state.nameErrorKey != null
              ? LocaleKeys.required.tr()
              : null,
          onChanged: context.read<InstituteCubit>().nameChanged,
        ),
        const VerticalSpace(16),

        CustomTextField(
          initialValue: state.location,
          hintText: LocaleKeys.location.tr(),
          errorText: state.locationErrorKey != null
              ? LocaleKeys.required.tr()
              : null,
          onChanged: context.read<InstituteCubit>().locationChanged,
        ),
        const VerticalSpace(16),

        CustomTextField(
          initialValue: state.notes,
          hintText: LocaleKeys.notes.tr(),
          maxLines: 3,
          onChanged: context.read<InstituteCubit>().notesChanged,
        ),
        const VerticalSpace(16),

        Row(
          children: [
            Expanded(child: _ManagerInput()),
            const HorizontalSpace(16),
            Expanded(child: _CenterInput()),
          ],
        ),
        const VerticalSpace(24),

        _SubmitButton(),
      ],
    );
  }
}

class _ManagerInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final res = context.watch<InstituteCubit>().state.managersResult;
    return res.when(
      empty: () => const SizedBox.shrink(),
      loading: () => const Center(child: CircularProgressIndicator()),
      failure: (_, _, msg) => Text(
        msg ?? LocaleKeys.firebase_generic_error.tr(),
        style: const TextStyle(color: Colors.red),
      ),
      success: (list) {
        final sel = context.watch<InstituteCubit>().state.managerId;
        final items = <DropdownMenuItem<String?>>[
          DropdownMenuItem(value: null, child: Text(LocaleKeys.manager.tr())),
          for (var t in list)
            DropdownMenuItem(
              value: t.id,
              child: Text('${t.firstName} ${t.lastName}'),
            ),
        ];
        return DropdownButtonFormField<String?>(
          value: sel,
          decoration: InputDecoration(
            hintText: LocaleKeys.manager.tr(),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          items: items,
          onChanged: context.read<InstituteCubit>().managerChanged,
        );
      },
    );
  }
}

class _CenterInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final res = context.watch<InstituteCubit>().state.centersResult;
    return res.when(
      empty: () => const SizedBox.shrink(),
      loading: () => const Center(child: CircularProgressIndicator()),
      failure: (_, _, msg) => Text(
        msg ?? LocaleKeys.firebase_generic_error.tr(),
        style: const TextStyle(color: Colors.red),
      ),
      success: (list) {
        final sel = context.watch<InstituteCubit>().state.centerId;
        final items = <DropdownMenuItem<String?>>[
          DropdownMenuItem(value: null, child: Text(LocaleKeys.center.tr())),
          for (var c in list)
            DropdownMenuItem(value: c.id, child: Text(c.name)),
        ];
        return DropdownButtonFormField<String?>(
          value: sel,
          decoration: InputDecoration(
            hintText: LocaleKeys.center.tr(),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          items: items,
          onChanged: context.read<InstituteCubit>().centerChanged,
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<InstituteCubit>().state;
    final isLoading = state.status.isLoading;
    final name = state.name;
    final location = state.location;
    final canSubmit = !isLoading && name.isNotEmpty && location.isNotEmpty;

    return PrimaryButton(
      text: LocaleKeys.save.tr(),
      loading: isLoading,
      onPressed: canSubmit
          ? () => context.read<InstituteCubit>().submit()
          : null,
    );
  }
}
