import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/constants/constants.dart';
import 'package:iqra_wa_irtaqi/core/helpers/spacing.dart';
import 'package:iqra_wa_irtaqi/core/localization/locale_keys.g.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/core/routing/routes_extension.dart';
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
            _InstituteBlocListener(),
            VerticalSpace(24),
            _InstituteForm(),
            VerticalSpace(16),
          ],
        ),
      ),
    );
  }
}

class _InstituteBlocListener extends StatelessWidget {
  const _InstituteBlocListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<InstituteCubit, InstituteState>(
      listenWhen: (p, c) => p.status != c.status,
      listener: (context, state) => state.status.when(
        success: (_) {
          final justSaved = ins.Institute(
            id: state.id,
            name: state.name,
            location: state.location,
            notes: state.notes.isEmpty ? null : state.notes,
            managerId: state.managerId,
          );
          context.pop(justSaved);
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
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _NameInput(),
        VerticalSpace(16),
        _LocationInput(),
        VerticalSpace(16),
        _NotesInput(),
        VerticalSpace(16),
        _ManagerInput(),
        VerticalSpace(24),
        _SubmitButton(),
      ],
    );
  }
}

class _NameInput extends StatelessWidget {
  const _NameInput();
  @override
  Widget build(BuildContext context) {
    final name = context.select((InstituteCubit c) => c.state.name);
    final errorKey = context.select((InstituteCubit c) => c.state.nameErrorKey);
    return CustomTextField(
      initialValue: name,
      hintText: LocaleKeys.name.tr(),
      errorText: errorKey != null ? LocaleKeys.required.tr() : null,
      onChanged: context.read<InstituteCubit>().nameChanged,
    );
  }
}

class _LocationInput extends StatelessWidget {
  const _LocationInput();
  @override
  Widget build(BuildContext context) {
    final loc = context.select((InstituteCubit c) => c.state.location);
    final errorKey = context.select(
      (InstituteCubit c) => c.state.locationErrorKey,
    );
    return CustomTextField(
      initialValue: loc,
      hintText: LocaleKeys.location.tr(),
      errorText: errorKey != null ? LocaleKeys.required.tr() : null,
      onChanged: context.read<InstituteCubit>().locationChanged,
    );
  }
}

class _NotesInput extends StatelessWidget {
  const _NotesInput();
  @override
  Widget build(BuildContext context) {
    final notes = context.select((InstituteCubit c) => c.state.notes);
    return CustomTextField(
      initialValue: notes,
      hintText: LocaleKeys.notes.tr(),
      maxLines: 3,
      onChanged: context.read<InstituteCubit>().notesChanged,
    );
  }
}

class _ManagerInput extends StatelessWidget {
  const _ManagerInput();
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
        final selected = context.watch<InstituteCubit>().state.managerId;
        final items = <DropdownMenuItem<String?>>[
          DropdownMenuItem(value: null, child: Text(LocaleKeys.manager.tr())),
          for (var t in list)
            DropdownMenuItem(
              value: t.id,
              child: Text('${t.firstName} ${t.lastName}'),
            ),
        ];
        return DropdownButtonFormField<String?>(
          value: selected,
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

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();
  @override
  Widget build(BuildContext context) {
    final state = context.watch<InstituteCubit>().state;
    final loading = state.status.isLoading;
    final isEditing = state.isEditing;
    final changed = isEditing
        ? (state.name != state.initialName ||
              state.location != state.initialLocation ||
              state.notes != state.initialNotes ||
              state.managerId != state.initialManagerId)
        : true;
    final hasError =
        state.nameErrorKey != null || state.locationErrorKey != null;
    final isEmpty = state.name.isEmpty || state.location.isEmpty;

    return PrimaryButton(
      text: LocaleKeys.save.tr(),
      loading: loading,
      onPressed: (!loading && !hasError && !isEmpty && changed)
          ? () => context.read<InstituteCubit>().submit()
          : null,
    );
  }
}
