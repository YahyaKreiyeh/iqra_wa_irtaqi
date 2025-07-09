import 'package:get_it/get_it.dart';
import 'package:iqra_wa_irtaqi/features/authentication/cubits/login/login_cubit.dart';
import 'package:iqra_wa_irtaqi/features/authentication/cubits/password_reset/password_reset_cubit.dart';
import 'package:iqra_wa_irtaqi/features/authentication/cubits/register/register_cubit.dart';
import 'package:iqra_wa_irtaqi/features/authentication/repositories/authentication_repository.dart';
import 'package:iqra_wa_irtaqi/features/centers/cubits/center/center_cubit.dart';
import 'package:iqra_wa_irtaqi/features/centers/cubits/centers/centers_cubit.dart';
import 'package:iqra_wa_irtaqi/features/centers/repositories/centers_repository.dart';
import 'package:iqra_wa_irtaqi/features/institutes/cubits/institute/institute_cubit.dart';
import 'package:iqra_wa_irtaqi/features/institutes/cubits/institutes/institutes_cubit.dart';
import 'package:iqra_wa_irtaqi/features/institutes/repositories/institutes_repository.dart';
import 'package:iqra_wa_irtaqi/features/snackbar/bloc/snackbar_bloc.dart';
import 'package:iqra_wa_irtaqi/features/students/cubits/student/student_cubit.dart';
import 'package:iqra_wa_irtaqi/features/students/cubits/students/students_cubit.dart';
import 'package:iqra_wa_irtaqi/features/students/repositories/students_repository.dart';
import 'package:iqra_wa_irtaqi/features/teachers/cubits/teacher/teacher_cubit.dart';
import 'package:iqra_wa_irtaqi/features/teachers/cubits/teachers/teachers_cubit.dart';
import 'package:iqra_wa_irtaqi/features/teachers/repositories/teachers_repository.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerFactory<SnackbarBloc>(() => SnackbarBloc());
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
  getIt.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepository(),
  );

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<PasswordResetCubit>(() => PasswordResetCubit(getIt()));

  getIt.registerFactory<InstituteCubit>(() => InstituteCubit(getIt()));
  getIt.registerFactory<InstitutesCubit>(() => InstitutesCubit(getIt()));
  getIt.registerLazySingleton<InstitutesRepository>(
    () => InstitutesRepository(),
  );

  getIt.registerFactory<CenterCubit>(() => CenterCubit(getIt()));
  getIt.registerFactory<CentersCubit>(() => CentersCubit(getIt()));
  getIt.registerLazySingleton<CentersRepository>(() => CentersRepository());

  getIt.registerFactory<TeacherCubit>(() => TeacherCubit(getIt()));
  getIt.registerFactory<TeachersCubit>(() => TeachersCubit(getIt()));
  getIt.registerLazySingleton<TeachersRepository>(() => TeachersRepository());

  getIt.registerFactory<StudentCubit>(() => StudentCubit(getIt()));
  getIt.registerFactory<StudentsCubit>(() => StudentsCubit(getIt()));
  getIt.registerLazySingleton<StudentsRepository>(() => StudentsRepository());
}
