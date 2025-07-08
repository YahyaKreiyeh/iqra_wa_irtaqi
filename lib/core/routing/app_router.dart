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
import 'package:iqra_wa_irtaqi/features/centers/cubits/center/center_cubit.dart';
import 'package:iqra_wa_irtaqi/features/centers/cubits/centers/centers_cubit.dart';
import 'package:iqra_wa_irtaqi/features/centers/models/center.dart' as ce;
import 'package:iqra_wa_irtaqi/features/centers/views/center_view.dart';
import 'package:iqra_wa_irtaqi/features/centers/views/centers_view.dart';
import 'package:iqra_wa_irtaqi/features/home/views/home_view.dart';
import 'package:iqra_wa_irtaqi/features/institutes/cubits/institute/institute_cubit.dart';
import 'package:iqra_wa_irtaqi/features/institutes/cubits/institutes/institutes_cubit.dart';
import 'package:iqra_wa_irtaqi/features/institutes/models/institute.dart';
import 'package:iqra_wa_irtaqi/features/institutes/views/institute_view.dart';
import 'package:iqra_wa_irtaqi/features/institutes/views/institutes_view.dart';
import 'package:iqra_wa_irtaqi/features/students/views/students_view.dart';
import 'package:iqra_wa_irtaqi/features/teachers/cubits/teacher/teacher_cubit.dart';
import 'package:iqra_wa_irtaqi/features/teachers/cubits/teachers/teachers_cubit.dart';
import 'package:iqra_wa_irtaqi/features/teachers/models/teacher.dart';
import 'package:iqra_wa_irtaqi/features/teachers/views/teacher_view.dart';
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
      case Routes.instituteView:
        final instituteArg = settings.arguments as Institute?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                getIt<InstituteCubit>()..initialize(instituteArg),
            child: const InstituteView(),
          ),
        );
      case Routes.institutesView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<InstitutesCubit>()..fetchMore(),
            child: const InstitutesView(),
          ),
        );
      case Routes.centerView:
        final centerArg = settings.arguments as ce.Center?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CenterCubit>()..initialize(centerArg),
            child: const CenterView(),
          ),
        );
      case Routes.centersView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CentersCubit>()..fetchMore(),
            child: const CentersView(),
          ),
        );

      case Routes.teacherView:
        final teacherArg = settings.arguments as Teacher?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<TeacherCubit>()..initialize(teacherArg),
            child: const TeacherView(),
          ),
        );
      case Routes.teachersView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<TeachersCubit>()..fetchMore(),
            child: const TeachersView(),
          ),
        );

      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.studentsView:
        return MaterialPageRoute(builder: (_) => const StudentsView());
      default:
        return null;
    }
  }
}
