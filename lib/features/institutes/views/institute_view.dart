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
import 'package:iqra_wa_irtaqi/features/institutes/models/institute.dart';

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
        child: Padding(
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
      listener: (context, state) {
        state.status.when(
          success: (_) {
            final justSaved = Institute(
              id: state.id,
              name: state.name,
              location: state.location,
              notes: state.notes.isEmpty ? null : state.notes,
            );
            context.pop(justSaved);
          },
          failure: (_, _, errorMessage) {},
          loading: () {},
          empty: () {},
        );
      },
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
    final location = context.select((InstituteCubit c) => c.state.location);
    final errorKey = context.select(
      (InstituteCubit c) => c.state.locationErrorKey,
    );

    return CustomTextField(
      initialValue: location,
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

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (InstituteCubit c) => c.state.status.isLoading,
    );
    final nameErr = context.select((InstituteCubit c) => c.state.nameErrorKey);
    final locErr = context.select(
      (InstituteCubit c) => c.state.locationErrorKey,
    );
    final name = context.select((InstituteCubit c) => c.state.name);
    final location = context.select((InstituteCubit c) => c.state.location);
    final notes = context.select((InstituteCubit c) => c.state.notes);
    final isEditing = context.select((InstituteCubit c) => c.state.isEditing);
    final initialName = context.select(
      (InstituteCubit c) => c.state.initialName,
    );
    final initialLoc = context.select(
      (InstituteCubit c) => c.state.initialLocation,
    );
    final initialNotes = context.select(
      (InstituteCubit c) => c.state.initialNotes,
    );

    final hasError = nameErr != null || locErr != null;
    final hasEmpty = name.isEmpty || location.isEmpty;
    final hasChanged = isEditing
        ? name != initialName || location != initialLoc || notes != initialNotes
        : true;
    final canSubmit = !isLoading && !hasError && !hasEmpty && hasChanged;

    return PrimaryButton(
      text: LocaleKeys.save.tr(),
      loading: isLoading,
      onPressed: canSubmit
          ? () => context.read<InstituteCubit>().submit()
          : null,
    );
  }
}
