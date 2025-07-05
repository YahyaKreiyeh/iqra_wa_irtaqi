import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iqra_wa_irtaqi/core/localization/locale_keys.g.dart';

/// A generic list‐view page with a search bar and FAB to add items.
class MosquesView extends StatelessWidget {
  const MosquesView({super.key});

  @override
  Widget build(BuildContext context) {
    final mosques = <String>[
      'مسجد الفلاح',
      'مسجد الهداية',
      'مسجد النور',
      // TODO: replace with real data source
    ];

    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.mosques.tr())),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...', // or a localized key
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (query) {
                // TODO: filter your list based on the query
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: mosques.length,
              itemBuilder: (context, index) =>
                  ListTile(title: Text(mosques[index])),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: navigate to add‐mosque form
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
