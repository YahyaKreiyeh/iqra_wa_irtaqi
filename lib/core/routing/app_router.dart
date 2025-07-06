import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqra_wa_irtaqi/core/di/dependency_injection.dart';
import 'package:iqra_wa_irtaqi/core/routing/routes.dart';
import 'package:iqra_wa_irtaqi/features/authentication/cubits/login/login_cubit.dart';
import 'package:iqra_wa_irtaqi/features/authentication/cubits/password_reset/password_reset_cubit.dart';
import 'package:iqra_wa_irtaqi/features/authentication/cubits/register/register_cubit.dart';
import 'package:iqra_wa_irtaqi/features/authentication/views/login_view.dart';
import 'package:iqra_wa_irtaqi/features/authentication/views/password_reset_view.dart';
import 'package:iqra_wa_irtaqi/features/authentication/views/register_view.dart';
import 'package:iqra_wa_irtaqi/features/home/views/home_view.dart';
import 'package:iqra_wa_irtaqi/features/mosques/cubits/mosque/mosque_cubit.dart';
import 'package:iqra_wa_irtaqi/features/mosques/cubits/mosques/mosques_cubit.dart';
import 'package:iqra_wa_irtaqi/features/mosques/models/mosque.dart';
import 'package:iqra_wa_irtaqi/features/mosques/views/mosque_view.dart';
import 'package:iqra_wa_irtaqi/features/mosques/views/mosques_view.dart';
import 'package:iqra_wa_irtaqi/features/students/views/students_view.dart';
import 'package:iqra_wa_irtaqi/features/teachers/views/teachers_view.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // TODO: add arguments to the routes
    // this arguments to be passed in any screen like this ( arguments as ClassName )
    // final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.registerView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: const RegisterView(),
          ),
        );
      case Routes.loginView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginView(),
          ),
        );
      case Routes.passwordResetView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<PasswordResetCubit>(),
            child: const PasswordResetView(),
          ),
        );
      case Routes.mosqueView:
        final mosqueArg = settings.arguments as Mosque?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<MosqueCubit>()..initialize(mosqueArg),
            child: const MosqueView(),
          ),
        );
      case Routes.mosquesView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<MosquesCubit>()..fetchMore(),
            child: const MosquesView(),
          ),
        );

      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.studentsView:
        return MaterialPageRoute(builder: (_) => const StudentsView());
      case Routes.teachersView:
        return MaterialPageRoute(builder: (_) => const TeachersView());
      default:
        return null;
    }
  }
}
