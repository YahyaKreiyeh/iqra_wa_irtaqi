import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iqra_wa_irtaqi/core/localization/locale_keys.g.dart';

class TeachersView extends StatelessWidget {
  const TeachersView({super.key});

  @override
  Widget build(BuildContext context) {
    final teachers = <String>[
      'معلم ١',
      'معلم ٢',
      'معلم ٣',
      // TODO: replace with real data source
    ];

    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.teachers.tr())),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
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
              itemCount: teachers.length,
              itemBuilder: (context, index) =>
                  ListTile(title: Text(teachers[index])),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: navigate to add‐teacher form
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
