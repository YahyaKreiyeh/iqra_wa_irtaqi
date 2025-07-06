import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/constants/constants.dart';
import 'package:iqra_wa_irtaqi/core/constants/enums.dart';
import 'package:iqra_wa_irtaqi/core/helpers/spacing.dart';
import 'package:iqra_wa_irtaqi/core/localization/locale_keys.g.dart';
import 'package:iqra_wa_irtaqi/core/models/result.dart';
import 'package:iqra_wa_irtaqi/core/widgets/buttons/primary_button.dart';
import 'package:iqra_wa_irtaqi/core/widgets/text_fields/custom_text_field.dart';
import 'package:iqra_wa_irtaqi/features/mosques/cubits/mosque/mosque_cubit.dart';
import 'package:iqra_wa_irtaqi/features/mosques/cubits/mosque/mosque_state.dart';
import 'package:iqra_wa_irtaqi/features/snackbar/bloc/snackbar_bloc.dart';

class MosqueView extends StatelessWidget {
  const MosqueView({super.key});

  @override
  Widget build(BuildContext context) {
    final isEditing = context.select((MosqueCubit c) => c.state.isEditing);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? LocaleKeys.edit_mosque.tr() : LocaleKeys.add_mosque.tr(),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _MosqueBlocListener(),
              VerticalSpace(24),
              _MosqueForm(),
              VerticalSpace(16),
            ],
          ),
        ),
      ),
    );
  }
}

class _MosqueBlocListener extends StatelessWidget {
  const _MosqueBlocListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<MosqueCubit, MosqueState>(
      listenWhen: (prev, curr) => prev.status != curr.status,
      listener: (context, state) {
        state.status.when(
          success: (_) {
            context.read<SnackbarBloc>().add(
              AddSnackbarEvent(
                message: LocaleKeys.mosque_added_success.tr(),
                type: SnackbarType.success,
              ),
            );
            Navigator.of(context).pop();
          },
          failure: (_, _, errorMessage) {
            context.read<SnackbarBloc>().add(
              AddSnackbarEvent(
                message: errorMessage ?? LocaleKeys.save_error.tr(),
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

class _MosqueForm extends StatelessWidget {
  const _MosqueForm();

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
    final name = context.select((MosqueCubit c) => c.state.name);
    final errorKey = context.select((MosqueCubit c) => c.state.nameErrorKey);

    return CustomTextField(
      initialValue: name,
      hintText: LocaleKeys.name.tr(),
      errorText: errorKey != null ? LocaleKeys.required.tr() : null,
      onChanged: context.read<MosqueCubit>().nameChanged,
    );
  }
}

class _LocationInput extends StatelessWidget {
  const _LocationInput();

  @override
  Widget build(BuildContext context) {
    final location = context.select((MosqueCubit c) => c.state.location);
    final errorKey = context.select(
      (MosqueCubit c) => c.state.locationErrorKey,
    );

    return CustomTextField(
      initialValue: location,
      hintText: LocaleKeys.location.tr(),
      errorText: errorKey != null ? LocaleKeys.required.tr() : null,
      onChanged: context.read<MosqueCubit>().locationChanged,
    );
  }
}

class _NotesInput extends StatelessWidget {
  const _NotesInput();

  @override
  Widget build(BuildContext context) {
    final notes = context.select((MosqueCubit c) => c.state.notes);

    return CustomTextField(
      initialValue: notes,
      hintText: LocaleKeys.notes.tr(),
      maxLines: 3,
      onChanged: context.read<MosqueCubit>().notesChanged,
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (MosqueCubit c) => c.state.status.isLoading,
    );
    final nameErr = context.select((MosqueCubit c) => c.state.nameErrorKey);
    final locErr = context.select((MosqueCubit c) => c.state.locationErrorKey);
    final name = context.select((MosqueCubit c) => c.state.name);
    final location = context.select((MosqueCubit c) => c.state.location);
    final notes = context.select((MosqueCubit c) => c.state.notes);
    final isEditing = context.select((MosqueCubit c) => c.state.isEditing);
    final initialName = context.select((MosqueCubit c) => c.state.initialName);
    final initialLoc = context.select(
      (MosqueCubit c) => c.state.initialLocation,
    );
    final initialNotes = context.select(
      (MosqueCubit c) => c.state.initialNotes,
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
      onPressed: canSubmit ? () => context.read<MosqueCubit>().submit() : null,
    );
  }
}
