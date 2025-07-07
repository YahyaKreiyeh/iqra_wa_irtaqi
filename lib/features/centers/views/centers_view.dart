import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/extensions/dialog_extensions.dart';
import 'package:iqra_wa_irtaqi/core/localization/locale_keys.g.dart';
import 'package:iqra_wa_irtaqi/core/routing/routes.dart';
import 'package:iqra_wa_irtaqi/core/routing/routes_extension.dart';
import 'package:iqra_wa_irtaqi/core/themes/app_colors.dart';
import 'package:iqra_wa_irtaqi/features/centers/cubits/centers/centers_cubit.dart';
import 'package:iqra_wa_irtaqi/features/centers/models/center.dart' as ce;

class CentersView extends StatelessWidget {
  const CentersView({super.key});

  @override
  Widget build(BuildContext context) {
    final isSelecting = context.select((CentersCubit c) => c.state.isSelecting);
    final selectedCount = context.select(
      (CentersCubit c) => c.state.selectedIds.length,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.centers.tr()),
        actions: [
          if (!isSelecting) ...[
            IconButton(
              icon: const Icon(Icons.check_box_outlined),
              onPressed: () =>
                  context.read<CentersCubit>().toggleSelectionMode(),
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
                  await context.read<CentersCubit>().deleteSelected();
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () =>
                  context.read<CentersCubit>().toggleSelectionMode(),
            ),
          ],
        ],
      ),
      body: const Column(children: [_SearchBar(), _CentersList()]),
      floatingActionButton: const _AddCenterButton(),
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
      context.read<CentersCubit>().search(q.trim());
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

class _CentersList extends StatelessWidget {
  const _CentersList();

  @override
  Widget build(BuildContext context) {
    final centers = context.select((CentersCubit c) => c.state.centers);
    final hasReachedMax = context.select(
      (CentersCubit c) => c.state.hasReachedMax,
    );
    final isLoading = context.select((CentersCubit c) => c.state.isLoading);
    final isSelecting = context.select((CentersCubit c) => c.state.isSelecting);
    final selectedIds = context.select((CentersCubit c) => c.state.selectedIds);

    if (centers.isEmpty && isLoading) {
      return const Expanded(child: Center(child: CircularProgressIndicator()));
    }
    if (centers.isEmpty) {
      return Expanded(child: Center(child: Text(LocaleKeys.no_data.tr())));
    }

    return Expanded(
      child: NotificationListener<ScrollNotification>(
        onNotification: (scroll) {
          if (scroll.metrics.pixels >= scroll.metrics.maxScrollExtent - 200) {
            context.read<CentersCubit>().fetchMore();
          }
          return false;
        },
        child: ListView.builder(
          itemCount: hasReachedMax ? centers.length : centers.length + 1,
          itemBuilder: (context, idx) {
            if (idx >= centers.length) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            final c = centers[idx];
            if (isSelecting) {
              return CheckboxListTile(
                value: selectedIds.contains(c.id),
                title: Text(c.name),
                subtitle: Text(c.location),
                onChanged: (_) =>
                    context.read<CentersCubit>().toggleSelect(c.id),
              );
            }
            return ListTile(
              title: Text(c.name),
              subtitle: Text(c.location),
              onTap: () async {
                final result = await context.pushNamed(
                  Routes.centerView,
                  arguments: c,
                );
                if (result != null && context.mounted) {
                  context.read<CentersCubit>().updateCenter(
                    result as ce.Center,
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

class _AddCenterButton extends StatelessWidget {
  const _AddCenterButton();

  @override
  Widget build(BuildContext context) {
    final isSelecting = context.select((CentersCubit c) => c.state.isSelecting);
    if (isSelecting) return const SizedBox.shrink();

    return FloatingActionButton(
      onPressed: () async {
        final result = await context.pushNamed(Routes.centerView);
        if (result != null && context.mounted) {
          context.read<CentersCubit>().addCenter(result as ce.Center);
        }
      },
      child: const Icon(Icons.add),
    );
  }
}
