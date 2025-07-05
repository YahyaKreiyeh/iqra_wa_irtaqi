import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iqra_wa_irtaqi/core/constants/constants.dart';
import 'package:iqra_wa_irtaqi/core/routing/app_router.dart';
import 'package:iqra_wa_irtaqi/core/routing/routes.dart';
import 'package:iqra_wa_irtaqi/core/themes/theme.dart';
import 'package:iqra_wa_irtaqi/features/snackbar/views/snackbar_view.dart';

class IqraWaIrtqi extends StatelessWidget {
  const IqraWaIrtqi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: iqraWaIrtqi,
      debugShowCheckedModeBanner: false,
      theme: getTheme(),
      initialRoute: Routes.registerView,
      onGenerateRoute: AppRouter().generateRoute,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (context, child) {
        final wrappedChild = SnackbarView(
          child: child ?? const SizedBox.shrink(),
        );
        return wrappedChild;
      },
    );
  }
}
