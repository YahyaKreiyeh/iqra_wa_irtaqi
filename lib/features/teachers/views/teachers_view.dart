// lib/features/teachers/views/teachers_view.dart
import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/extensions/dialog_extensions.dart';
import 'package:iqra_wa_irtaqi/core/localization/locale_keys.g.dart';
import 'package:iqra_wa_irtaqi/core/routing/routes.dart';
import 'package:iqra_wa_irtaqi/core/routing/routes_extension.dart';
import 'package:iqra_wa_irtaqi/core/themes/app_colors.dart';
import 'package:iqra_wa_irtaqi/features/teachers/cubits/teachers/teachers_cubit.dart';
import 'package:iqra_wa_irtaqi/features/teachers/models/teacher.dart';

/// Now a StatefulWidget that triggers initial fetch
class TeachersView extends StatefulWidget {
  const TeachersView({super.key});

  @override
  State<TeachersView> createState() => _TeachersViewState();
}

class _TeachersViewState extends State<TeachersView> {
  @override
  void initState() {
    super.initState();
    // fetch first page on load
    context.read<TeachersCubit>().fetchMore();
  }

  @override
  Widget build(BuildContext context) {
    final isSelecting = context.select(
      (TeachersCubit c) => c.state.isSelecting,
    );
    final selectedCount = context.select(
      (TeachersCubit c) => c.state.selectedIds.length,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.teachers.tr()),
        actions: [
          if (!isSelecting) ...[
            IconButton(
              icon: const Icon(Icons.check_box_outlined),
              onPressed: () =>
                  context.read<TeachersCubit>().toggleSelectionMode(),
            ),
          ] else ...[
            IconButton(
              icon: Badge(
                label: Text(
                  '$selectedCount',
                  style: const TextStyle(color: AppColors.white),
                ),
                child: const Icon(Icons.delete_outline),
              ),
              onPressed: () async {
                final ok = await context.showConfirmationDialog(
                  title: LocaleKeys.delete.tr(),
                  content: LocaleKeys.delete_selected_confirmation.tr(),
                  confirmText: LocaleKeys.delete.tr(),
                  cancelText: LocaleKeys.cancel.tr(),
                );
                if (ok && context.mounted) {
                  await context.read<TeachersCubit>().deleteSelected();
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () =>
                  context.read<TeachersCubit>().toggleSelectionMode(),
            ),
          ],
        ],
      ),
      body: const Column(children: [_SearchBar(), _TeachersList()]),
      floatingActionButton: const _AddTeacherButton(),
    );
  }
}

class _SearchBar extends StatefulWidget {
  const _SearchBar();
  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  Timer? _debounce;
  final _controller = TextEditingController();

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onSearchChanged(String q) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<TeachersCubit>().search(q.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: LocaleKeys.search.tr(),
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onChanged: _onSearchChanged,
      ),
    );
  }
}

class _TeachersList extends StatelessWidget {
  const _TeachersList();

  @override
  Widget build(BuildContext context) {
    final teachers = context.select((TeachersCubit c) => c.state.teachers);
    final hasReachedMax = context.select(
      (TeachersCubit c) => c.state.hasReachedMax,
    );
    final isLoading = context.select((TeachersCubit c) => c.state.isLoading);
    final isSelecting = context.select(
      (TeachersCubit c) => c.state.isSelecting,
    );
    final selectedIds = context.select(
      (TeachersCubit c) => c.state.selectedIds,
    );

    if (teachers.isEmpty && isLoading) {
      return const Expanded(child: Center(child: CircularProgressIndicator()));
    }
    if (teachers.isEmpty) {
      return Expanded(child: Center(child: Text(LocaleKeys.no_data.tr())));
    }

    return Expanded(
      child: NotificationListener<ScrollNotification>(
        onNotification: (scroll) {
          if (scroll.metrics.pixels >= scroll.metrics.maxScrollExtent - 200) {
            context.read<TeachersCubit>().fetchMore();
          }
          return false;
        },
        child: ListView.builder(
          itemCount: teachers.length + (isLoading && !hasReachedMax ? 1 : 0),
          itemBuilder: (context, idx) {
            if (idx >= teachers.length) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            final t = teachers[idx];
            if (isSelecting) {
              return CheckboxListTile(
                value: selectedIds.contains(t.id),
                title: Text('${t.firstName} ${t.lastName}'),
                subtitle: Text(DateFormat.yMMMd().format(t.birthDate)),
                onChanged: (_) =>
                    context.read<TeachersCubit>().toggleSelect(t.id),
              );
            }
            return ListTile(
              title: Text('${t.firstName} ${t.lastName}'),
              subtitle: Text(DateFormat.yMMMd().format(t.birthDate)),
              onTap: () async {
                final result = await context.pushNamed(
                  Routes.teacherView,
                  arguments: t,
                );
                if (result != null && context.mounted) {
                  context.read<TeachersCubit>().updateTeacher(
                    result as Teacher,
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}

class _AddTeacherButton extends StatelessWidget {
  const _AddTeacherButton();
  @override
  Widget build(BuildContext context) {
    final isSelecting = context.select(
      (TeachersCubit c) => c.state.isSelecting,
    );
    if (isSelecting) return const SizedBox.shrink();

    return FloatingActionButton(
      onPressed: () async {
        final result = await context.pushNamed(Routes.teacherView);
        if (result != null && context.mounted) {
          context.read<TeachersCubit>().addTeacher(result as Teacher);
        }
      },
      child: const Icon(Icons.person_add),
    );
  }
}
