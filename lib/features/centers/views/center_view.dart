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
import 'package:iqra_wa_irtaqi/features/centers/cubits/center/center_cubit.dart';
import 'package:iqra_wa_irtaqi/features/centers/cubits/center/center_state.dart';
import 'package:iqra_wa_irtaqi/features/centers/models/center.dart' as ce;

class CenterView extends StatelessWidget {
  const CenterView({super.key});

  @override
  Widget build(BuildContext context) {
    final isEditing = context.select((CenterCubit c) => c.state.isEditing);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? LocaleKeys.edit_center.tr() : LocaleKeys.add_center.tr(),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _CenterBlocListener(),
              VerticalSpace(24),
              _CenterForm(),
              VerticalSpace(16),
            ],
          ),
        ),
      ),
    );
  }
}

class _CenterBlocListener extends StatelessWidget {
  const _CenterBlocListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CenterCubit, CenterState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        state.status.when(
          success: (_) {
            final justSaved = ce.Center(
              id: state.id,
              name: state.name,
              location: state.location,
              notes: state.notes.isEmpty ? null : state.notes,
              managerId: state.managerId,
            );
            context.pop(justSaved);
          },
          failure: (_, _, errorMessage) {
            // handle failure if needed
          },
          loading: () {},
          empty: () {},
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}

class _CenterForm extends StatelessWidget {
  const _CenterForm();

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
    final name = context.select((CenterCubit c) => c.state.name);
    final errorKey = context.select((CenterCubit c) => c.state.nameErrorKey);

    return CustomTextField(
      initialValue: name,
      hintText: LocaleKeys.name.tr(),
      errorText: errorKey != null ? LocaleKeys.required.tr() : null,
      onChanged: context.read<CenterCubit>().nameChanged,
    );
  }
}

class _ManagerInput extends StatelessWidget {
  const _ManagerInput();

  @override
  Widget build(BuildContext context) {
    final mgrResult = context.watch<CenterCubit>().state.managersResult;

    return mgrResult.when(
      empty: () => const SizedBox.shrink(),
      loading: () => const Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
      failure: (err, data, msg) => Text(
        msg ?? LocaleKeys.firebase_generic_error.tr(),
        style: const TextStyle(color: Colors.red),
      ),
      success: (list) {
        final managerId = context.watch<CenterCubit>().state.managerId;
        final items = <DropdownMenuItem<String?>>[
          DropdownMenuItem(value: null, child: Text(LocaleKeys.manager.tr())),
          for (var t in list)
            DropdownMenuItem(
              value: t.id,
              child: Text('${t.firstName} ${t.lastName}'),
            ),
        ];
        return DropdownButtonFormField<String?>(
          value: managerId,
          decoration: InputDecoration(
            hintText: LocaleKeys.manager.tr(),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          items: items,
          onChanged: context.read<CenterCubit>().managerChanged,
        );
      },
    );
  }
}

class _LocationInput extends StatelessWidget {
  const _LocationInput();

  @override
  Widget build(BuildContext context) {
    final location = context.select((CenterCubit c) => c.state.location);
    final errorKey = context.select(
      (CenterCubit c) => c.state.locationErrorKey,
    );

    return CustomTextField(
      initialValue: location,
      hintText: LocaleKeys.location.tr(),
      errorText: errorKey != null ? LocaleKeys.required.tr() : null,
      onChanged: context.read<CenterCubit>().locationChanged,
    );
  }
}

class _NotesInput extends StatelessWidget {
  const _NotesInput();

  @override
  Widget build(BuildContext context) {
    final notes = context.select((CenterCubit c) => c.state.notes);
    return CustomTextField(
      initialValue: notes,
      hintText: LocaleKeys.notes.tr(),
      maxLines: 3,
      onChanged: context.read<CenterCubit>().notesChanged,
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (CenterCubit c) => c.state.status.isLoading,
    );
    final isEditing = context.select((CenterCubit c) => c.state.isEditing);
    final nameErr = context.select((CenterCubit c) => c.state.nameErrorKey);
    final locErr = context.select((CenterCubit c) => c.state.locationErrorKey);
    final name = context.select((CenterCubit c) => c.state.name);
    final location = context.select((CenterCubit c) => c.state.location);
    final notes = context.select((CenterCubit c) => c.state.notes);
    final manager = context.select((CenterCubit c) => c.state.managerId);
    final initialManager = context.select(
      (CenterCubit c) => c.state.initialManagerId,
    );

    final hasChanged = isEditing
        ? name != context.read<CenterCubit>().state.initialName ||
              location != context.read<CenterCubit>().state.initialLocation ||
              notes != context.read<CenterCubit>().state.initialNotes ||
              manager != initialManager
        : true;

    final hasError = nameErr != null || locErr != null;
    final hasEmpty = name.isEmpty || location.isEmpty;
    final canSubmit = !isLoading && !hasError && !hasEmpty && hasChanged;

    return PrimaryButton(
      text: LocaleKeys.save.tr(),
      loading: isLoading,
      onPressed: canSubmit ? () => context.read<CenterCubit>().submit() : null,
    );
  }
}
