import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/extensions/dialog_extensions.dart';
import 'package:iqra_wa_irtaqi/core/localization/locale_keys.g.dart';
import 'package:iqra_wa_irtaqi/core/routing/routes.dart';
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
                        final result = await Navigator.of(
                          context,
                        ).pushNamed(Routes.studentView, arguments: s);
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
                final result = await Navigator.of(
                  context,
                ).pushNamed(Routes.studentView);
                if (result != null && context.mounted) {
                  context.read<StudentsCubit>().addStudent(result as Student);
                }
              },
            ),
    );
  }
}
