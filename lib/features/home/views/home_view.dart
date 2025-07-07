import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iqra_wa_irtaqi/core/extensions/dialog_extensions.dart';
import 'package:iqra_wa_irtaqi/core/helpers/spacing.dart';
import 'package:iqra_wa_irtaqi/core/localization/locale_keys.g.dart';
import 'package:iqra_wa_irtaqi/core/routing/routes.dart';
import 'package:iqra_wa_irtaqi/core/routing/routes_extension.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.home.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: LocaleKeys.logout.tr(),
            onPressed: () {
              context
                  .showConfirmationDialog(
                    title: LocaleKeys.logout.tr(),
                    content: LocaleKeys.logout_confirmation.tr(),
                    confirmText: LocaleKeys.yes.tr(),
                    cancelText: LocaleKeys.no.tr(),
                  )
                  .then((confirmed) async {
                    if (!confirmed) return;
                    await FirebaseAuth.instance.signOut();
                    if (!navigator.mounted) return;
                    navigator.pushReplacementNamed(Routes.loginView);
                  });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _MenuCard(
              label: LocaleKeys.centers.tr(),
              icon: Icons.apartment,
              onTap: () {
                context.pushNamed(Routes.centersView);
              },
            ),
            const VerticalSpace(16),
            _MenuCard(
              label: LocaleKeys.institutes.tr(),
              icon: Icons.mosque,
              onTap: () {
                context.pushNamed(Routes.institutesView);
              },
            ),
            const VerticalSpace(16),
            _MenuCard(
              label: LocaleKeys.teachers.tr(),
              icon: Icons.person,
              onTap: () {
                context.pushNamed(Routes.teachersView);
              },
            ),
            const VerticalSpace(16),
            _MenuCard(
              label: LocaleKeys.students.tr(),
              icon: Icons.school,
              onTap: () {
                context.pushNamed(Routes.studentsView);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _MenuCard({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, size: 32),
        title: Text(label, style: const TextStyle(fontSize: 18)),
        trailing: const Icon(Icons.keyboard_arrow_left),
        onTap: onTap,
      ),
    );
  }
}
