import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/constants/enums.dart';
import 'package:iqra_wa_irtaqi/core/extensions/dialog_extensions.dart';
import 'package:iqra_wa_irtaqi/core/localization/locale_keys.g.dart';
import 'package:iqra_wa_irtaqi/core/routing/routes.dart';
import 'package:iqra_wa_irtaqi/core/routing/routes_extension.dart';
import 'package:iqra_wa_irtaqi/core/themes/app_colors.dart';
import 'package:iqra_wa_irtaqi/features/centers/models/center.dart' as ce;
import 'package:iqra_wa_irtaqi/features/institutes/cubits/institutes/institutes_cubit.dart';
import 'package:iqra_wa_irtaqi/features/institutes/models/institute.dart';

class InstitutesView extends StatelessWidget {
  const InstitutesView({super.key});

  @override
  Widget build(BuildContext context) {
    final center = context.select((InstitutesCubit c) => c.state.center);
    final institutes = context.select(
      (InstitutesCubit c) => c.state.institutes,
    );

    final isSelecting = context.select(
      (InstitutesCubit c) => c.state.isSelecting,
    );
    final selectedCount = context.select(
      (InstitutesCubit c) => c.state.selectedIds.length,
    );

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            context.pop(center);
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            center != null ? 'مركز ${center.name}' : LocaleKeys.institutes.tr(),
          ),
          actions: [
            if (center != null && !isSelecting)
              IconButton(
                tooltip: LocaleKeys.edit_center.tr(),
                icon: const Icon(Icons.edit),
                onPressed: () async {
                  final updated = await context.pushNamed(
                    Routes.centerView,
                    arguments: center,
                  );
                  if (updated != null && context.mounted) {
                    context.read<InstitutesCubit>().updateCenter(
                      updated as ce.Center,
                    );
                  }
                },
              ),

            if (!isSelecting) ...[
              IconButton(
                icon: const Icon(Icons.check_box_outlined),
                onPressed: () =>
                    context.read<InstitutesCubit>().toggleSelectionMode(),
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
                    await context.read<InstitutesCubit>().deleteSelected();
                  }
                },
              ),

              PopupMenuButton<BulkAction>(
                icon: const Icon(Icons.more_vert),
                onSelected: (action) {
                  final cubit = context.read<InstitutesCubit>();
                  final allIds = institutes.map((i) => i.id).toSet();
                  switch (action) {
                    case BulkAction.selectAll:
                      cubit.selectAll(allIds);
                      break;
                    case BulkAction.clearSelection:
                      cubit.clearSelection();
                      break;
                    case BulkAction.invertSelection:
                      cubit.invertSelection(allIds: allIds);
                      break;
                  }
                },
                itemBuilder: (_) => [
                  PopupMenuItem(
                    value: BulkAction.selectAll,
                    child: Text(LocaleKeys.select_all.tr()),
                  ),
                  PopupMenuItem(
                    value: BulkAction.clearSelection,
                    child: Text(LocaleKeys.deselect_all.tr()),
                  ),
                  PopupMenuItem(
                    value: BulkAction.invertSelection,
                    child: Text(LocaleKeys.invert_selection.tr()),
                  ),
                ],
              ),

              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () =>
                    context.read<InstitutesCubit>().toggleSelectionMode(),
              ),
            ],
          ],
        ),
        body: const Column(children: [_SearchBar(), _InstitutesList()]),
        floatingActionButton: const _AddInstituteButton(),
      ),
    );
  }
}

class _AddInstituteButton extends StatelessWidget {
  const _AddInstituteButton();

  @override
  Widget build(BuildContext context) {
    final isSelecting = context.select(
      (InstitutesCubit c) => c.state.isSelecting,
    );
    final centerId = context.select((InstitutesCubit c) => c.state.center?.id);

    if (isSelecting) return const SizedBox.shrink();

    return FloatingActionButton(
      onPressed: () async {
        final newInstitute = await context.pushNamed(
          Routes.instituteView,
          arguments: Institute(
            id: '',
            name: '',
            location: '',
            notes: null,
            managerId: null,
            centerId: centerId,
          ),
        );
        if (newInstitute != null && context.mounted) {
          context.read<InstitutesCubit>().addInstitute(newInstitute);
        }
      },
      tooltip: LocaleKeys.add_institute.tr(),
      child: const Icon(Icons.add),
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
      context.read<InstitutesCubit>().search(q.trim());
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

class _InstitutesList extends StatelessWidget {
  const _InstitutesList();

  @override
  Widget build(BuildContext context) {
    final institutes = context.select(
      (InstitutesCubit c) => c.state.institutes,
    );
    final hasReachedMax = context.select(
      (InstitutesCubit c) => c.state.hasReachedMax,
    );
    final isLoading = context.select((InstitutesCubit c) => c.state.isLoading);
    final isSelecting = context.select(
      (InstitutesCubit c) => c.state.isSelecting,
    );
    final selectedIds = context.select(
      (InstitutesCubit c) => c.state.selectedIds,
    );

    if (institutes.isEmpty && isLoading) {
      return const Expanded(child: Center(child: CircularProgressIndicator()));
    }
    if (institutes.isEmpty) {
      return Expanded(child: Center(child: Text(LocaleKeys.no_data.tr())));
    }

    return Expanded(
      child: NotificationListener<ScrollNotification>(
        onNotification: (scroll) {
          if (scroll.metrics.pixels >= scroll.metrics.maxScrollExtent - 200) {
            context.read<InstitutesCubit>().fetchMore();
          }
          return false;
        },
        child: ListView.builder(
          itemCount: institutes.length + (isLoading && !hasReachedMax ? 1 : 0),
          itemBuilder: (context, idx) {
            if (idx >= institutes.length) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            final m = institutes[idx];
            if (isSelecting) {
              return CheckboxListTile(
                value: selectedIds.contains(m.id),
                title: Text(m.name),
                subtitle: Text(m.location),
                onChanged: (_) =>
                    context.read<InstitutesCubit>().toggleSelect(m.id),
              );
            }
            return ListTile(
              title: Text(m.name),
              subtitle: Text(m.location),
              onTap: () async {
                final updated = await context.pushNamed(
                  Routes.studentsView,
                  arguments: m,
                );
                if (updated != null && context.mounted) {
                  context.read<InstitutesCubit>().updateInstitute(
                    updated as Institute,
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
