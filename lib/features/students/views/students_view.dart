import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/constants/enums.dart';
import 'package:iqra_wa_irtaqi/core/extensions/dialog_extensions.dart';
import 'package:iqra_wa_irtaqi/core/localization/locale_keys.g.dart';
import 'package:iqra_wa_irtaqi/core/routing/routes.dart';
import 'package:iqra_wa_irtaqi/core/routing/routes_extension.dart';
import 'package:iqra_wa_irtaqi/core/themes/app_colors.dart';
import 'package:iqra_wa_irtaqi/features/institutes/models/institute.dart';
import 'package:iqra_wa_irtaqi/features/students/cubits/students/students_cubit.dart';
import 'package:iqra_wa_irtaqi/features/students/models/student.dart';

class StudentsView extends StatelessWidget {
  const StudentsView({super.key});

  @override
  Widget build(BuildContext context) {
    final institute = context.select((StudentsCubit c) => c.state.institute);
    final isSelecting = context.select(
      (StudentsCubit c) => c.state.isSelecting,
    );
    final selCount = context.select(
      (StudentsCubit c) => c.state.selectedIds.length,
    );

    return WillPopScope(
      onWillPop: () async {
        if (institute != null) {
          context.pop(institute);
        } else {
          context.pop();
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            institute != null
                ? 'معهد ${institute.name}'
                : LocaleKeys.students.tr(),
          ),
          actions: [
            if (institute != null && !isSelecting)
              IconButton(
                tooltip: LocaleKeys.edit_institute.tr(),
                icon: const Icon(Icons.edit),
                onPressed: () async {
                  final updated = await context.pushNamed(
                    Routes.instituteView,
                    arguments: institute,
                  );
                  if (updated != null && context.mounted) {
                    context.read<StudentsCubit>().updateInstitute(
                      updated as Institute,
                    );
                  }
                },
              ),
            if (!isSelecting)
              IconButton(
                icon: const Icon(Icons.check_box_outlined),
                onPressed: () =>
                    context.read<StudentsCubit>().toggleSelectionMode(),
              )
            else ...[
              IconButton(
                icon: Badge(
                  label: Text(
                    '$selCount',
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
                    context.read<StudentsCubit>().deleteSelected();
                  }
                },
              ),

              PopupMenuButton<BatchAction>(
                icon: const Icon(Icons.more_vert),
                onSelected: (action) =>
                    context.read<StudentsCubit>().handleBatch(action),
                itemBuilder: (_) => [
                  PopupMenuItem(
                    value: BatchAction.selectAll,
                    child: Text(LocaleKeys.select_all.tr()),
                  ),
                  PopupMenuItem(
                    value: BatchAction.clearSelection,
                    child: Text(LocaleKeys.deselect_all.tr()),
                  ),
                  PopupMenuItem(
                    value: BatchAction.invertSelection,
                    child: Text(LocaleKeys.invert_selection.tr()),
                  ),
                  const PopupMenuDivider(),
                  PopupMenuItem(
                    value: BatchAction.nominateGhaibi,
                    child: Text(LocaleKeys.nomination_ghaibi.tr()),
                  ),
                  PopupMenuItem(
                    value: BatchAction.unnominateGhaibi,
                    child: Text(
                      '${LocaleKeys.nomination_ghaibi.tr()} ${LocaleKeys.cancel.tr()}',
                    ),
                  ),
                  PopupMenuItem(
                    value: BatchAction.nominateNazari,
                    child: Text(LocaleKeys.nomination_nazari.tr()),
                  ),
                  PopupMenuItem(
                    value: BatchAction.unnominateNazari,
                    child: Text(
                      '${LocaleKeys.nomination_nazari.tr()} ${LocaleKeys.cancel.tr()}',
                    ),
                  ),
                  PopupMenuItem(
                    value: BatchAction.nominateHadith,
                    child: Text(LocaleKeys.nomination_hadith.tr()),
                  ),
                  PopupMenuItem(
                    value: BatchAction.unnominateHadith,
                    child: Text(
                      '${LocaleKeys.nomination_hadith.tr()} ${LocaleKeys.cancel.tr()}',
                    ),
                  ),
                  const PopupMenuDivider(),
                  PopupMenuItem(
                    value: BatchAction.gradeGhaibiPassed,
                    child: Text(
                      '${LocaleKeys.nomination_ghaibi.tr()} · ${LocaleKeys.passed.tr()}',
                    ),
                  ),
                  PopupMenuItem(
                    value: BatchAction.gradeGhaibiFailed,
                    child: Text(
                      '${LocaleKeys.nomination_ghaibi.tr()} · ${LocaleKeys.failed.tr()}',
                    ),
                  ),
                  PopupMenuItem(
                    value: BatchAction.gradeNazariPassed,
                    child: Text(
                      '${LocaleKeys.nomination_nazari.tr()} · ${LocaleKeys.passed.tr()}',
                    ),
                  ),
                  PopupMenuItem(
                    value: BatchAction.gradeNazariFailed,
                    child: Text(
                      '${LocaleKeys.nomination_nazari.tr()} · ${LocaleKeys.failed.tr()}',
                    ),
                  ),
                  PopupMenuItem(
                    value: BatchAction.gradeHadithPassed,
                    child: Text(
                      '${LocaleKeys.nomination_hadith.tr()} · ${LocaleKeys.passed.tr()}',
                    ),
                  ),
                  PopupMenuItem(
                    value: BatchAction.gradeHadithFailed,
                    child: Text(
                      '${LocaleKeys.nomination_hadith.tr()} · ${LocaleKeys.failed.tr()}',
                    ),
                  ),
                ],
              ),

              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () =>
                    context.read<StudentsCubit>().toggleSelectionMode(),
              ),
            ],
          ],
        ),
        body: const Column(children: [_SearchBar(), _StudentsList()]),
        floatingActionButton: isSelecting
            ? null
            : const _AddStudentButton(inline: false),
      ),
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
  final _ctrl = TextEditingController();

  @override
  void dispose() {
    _debounce?.cancel();
    _ctrl.dispose();
    super.dispose();
  }

  void _onChanged(String q) {
    _debounce?.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 500),
      () => context.read<StudentsCubit>().search(q.trim()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: _ctrl,
        decoration: InputDecoration(
          hintText: LocaleKeys.search.tr(),
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onChanged: _onChanged,
      ),
    );
  }
}

class _StudentsList extends StatelessWidget {
  const _StudentsList();

  @override
  Widget build(BuildContext context) {
    final students = context.select((StudentsCubit c) => c.state.students);
    final hasReachedMax = context.select(
      (StudentsCubit c) => c.state.hasReachedMax,
    );
    final isLoading = context.select((StudentsCubit c) => c.state.isLoading);
    final isSelecting = context.select(
      (StudentsCubit c) => c.state.isSelecting,
    );
    final selectedIds = context.select(
      (StudentsCubit c) => c.state.selectedIds,
    );

    if (students.isEmpty && isLoading) {
      return const Expanded(child: Center(child: CircularProgressIndicator()));
    }
    if (students.isEmpty) {
      return Expanded(child: Center(child: Text(LocaleKeys.no_students.tr())));
    }

    return Expanded(
      child: NotificationListener<ScrollNotification>(
        onNotification: (scroll) {
          if (scroll.metrics.pixels >= scroll.metrics.maxScrollExtent - 200) {
            context.read<StudentsCubit>().fetchMore();
          }
          return false;
        },
        child: ListView.builder(
          itemCount: students.length + (isLoading && !hasReachedMax ? 1 : 0),
          itemBuilder: (ctx, idx) {
            if (idx >= students.length) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            final s = students[idx];
            if (isSelecting) {
              return CheckboxListTile(
                value: selectedIds.contains(s.id),
                title: Text('${s.firstName} ${s.lastName}'),
                subtitle: Text(DateFormat.yMMMd().format(s.birthDate)),
                onChanged: (_) =>
                    context.read<StudentsCubit>().toggleSelect(s.id),
              );
            }
            return ListTile(
              title: Text('${s.firstName} ${s.lastName}'),
              subtitle: Text(DateFormat.yMMMd().format(s.birthDate)),
              onTap: () async {
                final updated = await context.pushNamed(
                  Routes.studentView,
                  arguments: s,
                );
                if (updated != null && context.mounted) {
                  context.read<StudentsCubit>().updateStudent(
                    updated as Student,
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

class _AddStudentButton extends StatelessWidget {
  const _AddStudentButton({required this.inline});
  final bool inline;

  @override
  Widget build(BuildContext context) {
    final institute = context.select((StudentsCubit c) => c.state.institute);

    return FloatingActionButton(
      tooltip: LocaleKeys.add_student.tr(),
      child: const Icon(Icons.add),
      onPressed: () async {
        final result = await context.pushNamed(
          Routes.studentView,
          arguments: institute,
        );
        if (result != null && context.mounted) {
          context.read<StudentsCubit>().addStudent(result as Student);
        }
      },
    );
  }
}
