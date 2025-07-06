import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/localization/locale_keys.g.dart';
import 'package:iqra_wa_irtaqi/core/routing/routes.dart';
import 'package:iqra_wa_irtaqi/core/routing/routes_extension.dart';
import 'package:iqra_wa_irtaqi/features/mosques/cubits/mosques/mosques_cubit.dart';
import 'package:iqra_wa_irtaqi/features/mosques/cubits/mosques/mosques_state.dart';
import 'package:iqra_wa_irtaqi/features/mosques/models/mosque.dart';

class MosquesView extends StatelessWidget {
  const MosquesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.mosques.tr())),
      body: const Column(children: [_SearchBar(), _MosquesList()]),
      floatingActionButton: const _AddMosqueButton(),
    );
  }
}

class _AddMosqueButton extends StatelessWidget {
  const _AddMosqueButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.pushNamed(Routes.mosqueView),
      child: const Icon(Icons.add),
    );
  }
}

class _MosquesList extends StatelessWidget {
  const _MosquesList();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<MosquesCubit, MosquesState>(
        builder: (context, state) {
          if (state.errorMessage != null && state.mosques.isEmpty) {
            return Center(child: Text(state.errorMessage!));
          }
          if (state.isLoading && state.mosques.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return NotificationListener<ScrollNotification>(
            onNotification: (scroll) {
              if (scroll.metrics.pixels >=
                  scroll.metrics.maxScrollExtent - 200) {
                context.read<MosquesCubit>().fetchMore();
              }
              return false;
            },
            child: ListView.builder(
              itemCount: state.hasReachedMax
                  ? state.mosques.length
                  : state.mosques.length + 1,
              itemBuilder: (context, idx) {
                if (idx < state.mosques.length) {
                  final mosque = state.mosques[idx];
                  return ListTile(
                    title: Text(mosque.name),
                    subtitle: Text(mosque.location),
                    onTap: () async {
                      final updated =
                          await context.pushNamed(
                                Routes.mosqueView,
                                arguments: mosque,
                              )
                              as Mosque?;
                      if (updated != null && context.mounted) {
                        context.read<MosquesCubit>().updateMosque(updated);
                      }
                    },
                  );
                }
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Center(child: CircularProgressIndicator()),
                );
              },
            ),
          );
        },
      ),
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
        onChanged: (q) {},
      ),
    );
  }
}
