import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/constants/enums.dart';
import 'package:iqra_wa_irtaqi/core/extensions/dialog_extensions.dart';
import 'package:iqra_wa_irtaqi/core/localization/locale_keys.g.dart';
import 'package:iqra_wa_irtaqi/core/routing/routes.dart';
import 'package:iqra_wa_irtaqi/core/routing/routes_extension.dart';
import 'package:iqra_wa_irtaqi/features/students/cubits/students/students_cubit.dart';
import 'package:iqra_wa_irtaqi/features/students/models/student.dart';

class StudentsView extends StatefulWidget {
  const StudentsView({super.key});
  @override
  State<StudentsView> createState() => _StudentsViewState();
}

class _StudentsViewState extends State<StudentsView> {
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    context.read<StudentsCubit>().fetchMore();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String q) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<StudentsCubit>().search(q.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<StudentsCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.students.tr()),
        actions: [
          if (!state.isSelecting)
            IconButton(
              icon: const Icon(Icons.check_box_outlined),
              onPressed: () =>
                  context.read<StudentsCubit>().toggleSelectionMode(),
            )
          else ...[
            IconButton(
              icon: Badge(
                label: Text('${state.selectedIds.length}'),
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
              onSelected: (action) {
                final cubit = context.read<StudentsCubit>();
                switch (action) {
                  case BatchAction.selectAll:
                    cubit.toggleSelectAll();
                    break;

                  case BatchAction.nominateGhaibi:
                    cubit.batchNominateGhaibi(true);
                    break;
                  case BatchAction.unnominateGhaibi:
                    cubit.batchNominateGhaibi(false);
                    break;

                  case BatchAction.nominateNazari:
                    cubit.batchNominateNazari(true);
                    break;
                  case BatchAction.unnominateNazari:
                    cubit.batchNominateNazari(false);
                    break;

                  case BatchAction.nominateHadith:
                    cubit.batchNominateHadith(true);
                    break;
                  case BatchAction.unnominateHadith:
                    cubit.batchNominateHadith(false);
                    break;

                  case BatchAction.gradeGhaibiPassed:
                    cubit.batchGradeGhaibi(true);
                    break;
                  case BatchAction.gradeGhaibiFailed:
                    cubit.batchGradeGhaibi(false);
                    break;

                  case BatchAction.gradeNazariPassed:
                    cubit.batchGradeNazari(true);
                    break;
                  case BatchAction.gradeNazariFailed:
                    cubit.batchGradeNazari(false);
                    break;

                  case BatchAction.gradeHadithPassed:
                    cubit.batchGradeHadith(true);
                    break;
                  case BatchAction.gradeHadithFailed:
                    cubit.batchGradeHadith(false);
                    break;
                }
              },
              itemBuilder: (_) {
                final selCount = state.selectedIds.length;
                final total = state.students.length;
                return [
                  PopupMenuItem(
                    value: BatchAction.selectAll,
                    child: Text(
                      selCount < total
                          ? LocaleKeys.select_all.tr()
                          : LocaleKeys.deselect_all.tr(),
                    ),
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
                ];
              },
            ),

            // Exit selection
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () =>
                  context.read<StudentsCubit>().toggleSelectionMode(),
            ),
          ],
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: LocaleKeys.search.tr(),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: _onSearchChanged,
            ),
          ),
          if (state.students.isEmpty && state.isLoading)
            const Expanded(child: Center(child: CircularProgressIndicator()))
          else if (state.students.isEmpty)
            Expanded(child: Center(child: Text(LocaleKeys.no_data.tr())))
          else
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (scroll) {
                  if (scroll.metrics.pixels >=
                      scroll.metrics.maxScrollExtent - 200) {
                    context.read<StudentsCubit>().fetchMore();
                  }
                  return false;
                },
                child: ListView.builder(
                  itemCount:
                      state.students.length +
                      (state.isLoading && !state.hasReachedMax ? 1 : 0),
                  itemBuilder: (ctx, idx) {
                    if (idx >= state.students.length) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    final s = state.students[idx];
                    if (state.isSelecting) {
                      return CheckboxListTile(
                        value: state.selectedIds.contains(s.id),
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
                        final result = await context.pushNamed(
                          Routes.studentView,
                          arguments: s,
                        );
                        if (result != null && context.mounted) {
                          context.read<StudentsCubit>().updateStudent(
                            result as Student,
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: state.isSelecting
          ? null
          : FloatingActionButton(
              child: const Icon(Icons.school),
              onPressed: () async {
                final result = await context.pushNamed(Routes.studentView);
                if (result != null && context.mounted) {
                  context.read<StudentsCubit>().addStudent(result as Student);
                }
              },
            ),
    );
  }
}
