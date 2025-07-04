import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/di/dependency_injection.dart';
import 'package:iqra_wa_irtaqi/core/localization/codegen_loader.g.dart';
import 'package:iqra_wa_irtaqi/features/snackbar/bloc/snackbar_bloc.dart';
import 'package:iqra_wa_irtaqi/firebase_options.dart';
import 'package:iqra_wa_irtaqi/iqra_wa_irtaqi.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupGetIt();
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      assetLoader: const CodegenLoader(),
      child: BlocProvider(
        create: (context) => getIt<SnackbarBloc>(),
        child: const IqraWaIrtqi(),
      ),
    ),
  );
}
