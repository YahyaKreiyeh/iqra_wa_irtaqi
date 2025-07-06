// TODO: handle displaying error messages in case of errors in deletion
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/extensions/dialog_extensions.dart';
import 'package:iqra_wa_irtaqi/core/localization/locale_keys.g.dart';
import 'package:iqra_wa_irtaqi/core/routing/routes.dart';
import 'package:iqra_wa_irtaqi/core/routing/routes_extension.dart';
import 'package:iqra_wa_irtaqi/core/themes/app_colors.dart';
import 'package:iqra_wa_irtaqi/features/mosques/cubits/mosques/mosques_cubit.dart';

class MosquesView extends StatelessWidget {
  const MosquesView({super.key});

  @override
  Widget build(BuildContext context) {
    final isSelecting = context.select((MosquesCubit c) => c.state.isSelecting);
    final selectedCount = context.select(
      (MosquesCubit c) => c.state.selectedIds.length,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.mosques.tr()),
        actions: [
          if (!isSelecting) ...[
            IconButton(
              icon: const Icon(Icons.check_box),
              onPressed: () =>
                  context.read<MosquesCubit>().toggleSelectionMode(),
            ),
          ] else ...[
            IconButton(
              icon: Badge(
                label: Text(
                  '$selectedCount',
                  style: const TextStyle(color: AppColors.white),
                ),
                child: const Icon(Icons.delete),
              ),
              onPressed: () async {
                final ok = await context.showConfirmationDialog(
                  title: LocaleKeys.delete.tr(),
                  content: LocaleKeys.delete_selected_confirmation.tr(),
                  confirmText: LocaleKeys.delete.tr(),
                  cancelText: LocaleKeys.cancel.tr(),
                );
                if (ok && context.mounted) {
                  await context.read<MosquesCubit>().deleteSelected();
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () =>
                  context.read<MosquesCubit>().toggleSelectionMode(),
            ),
          ],
        ],
      ),
      body: const Column(children: [_SearchBar(), _MosquesList()]),
      floatingActionButton: const _AddMosqueButton(),
    );
  }
}

class _AddMosqueButton extends StatelessWidget {
  const _AddMosqueButton();

  @override
  Widget build(BuildContext context) {
    final isSelecting = context.select((MosquesCubit c) => c.state.isSelecting);
    return isSelecting
        ? const SizedBox.shrink()
        : FloatingActionButton(
            onPressed: () => context.pushNamed(Routes.mosqueView),
            child: const Icon(Icons.add),
          );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: LocaleKeys.search.tr(),
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onChanged: (q) {
          // TODO: implement search filtering
        },
      ),
    );
  }
}

class _MosquesList extends StatelessWidget {
  const _MosquesList();

  @override
  Widget build(BuildContext context) {
    final mosques = context.select((MosquesCubit c) => c.state.mosques);
    final hasReachedMax = context.select(
      (MosquesCubit c) => c.state.hasReachedMax,
    );
    final isLoading = context.select((MosquesCubit c) => c.state.isLoading);
    final isSelecting = context.select((MosquesCubit c) => c.state.isSelecting);
    final selectedIds = context.select((MosquesCubit c) => c.state.selectedIds);

    if (mosques.isEmpty && isLoading) {
      return const Expanded(child: Center(child: CircularProgressIndicator()));
    }
    if (mosques.isEmpty) {
      return Expanded(child: Center(child: Text(LocaleKeys.no_data.tr())));
    }

    return Expanded(
      child: NotificationListener<ScrollNotification>(
        onNotification: (scroll) {
          if (scroll.metrics.pixels >= scroll.metrics.maxScrollExtent - 200) {
            context.read<MosquesCubit>().fetchMore();
          }
          return false;
        },
        child: ListView.builder(
          itemCount: hasReachedMax ? mosques.length : mosques.length + 1,
          itemBuilder: (context, idx) {
            if (idx >= mosques.length) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            final m = mosques[idx];
            if (isSelecting) {
              return CheckboxListTile(
                value: selectedIds.contains(m.id),
                title: Text(m.name),
                subtitle: Text(m.location),
                onChanged: (_) =>
                    context.read<MosquesCubit>().toggleSelect(m.id!),
              );
            }
            return ListTile(
              title: Text(m.name),
              subtitle: Text(m.location),
              onTap: () async {
                final updated = await context.pushNamed(
                  Routes.mosqueView,
                  arguments: m,
                );
                if (updated != null && context.mounted) {
                  context.read<MosquesCubit>().updateMosque(updated);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
