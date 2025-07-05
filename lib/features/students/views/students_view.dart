import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iqra_wa_irtaqi/core/localization/locale_keys.g.dart';

class StudentsView extends StatelessWidget {
  const StudentsView({super.key});

  @override
  Widget build(BuildContext context) {
    final students = <String>[
      'طالب ١',
      'طالب ٢',
      'طالب ٣',
      // TODO: replace with real data source
    ];

    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.students.tr())),
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
              itemCount: students.length,
              itemBuilder: (context, index) =>
                  ListTile(title: Text(students[index])),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: navigate to add‐student form
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
