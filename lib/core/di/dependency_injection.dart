import 'package:get_it/get_it.dart';
import 'package:iqra_wa_irtaqi/features/authentication/cubits/login/login_cubit.dart';
import 'package:iqra_wa_irtaqi/features/authentication/cubits/password_reset/password_reset_cubit.dart';
import 'package:iqra_wa_irtaqi/features/authentication/cubits/register/register_cubit.dart';
import 'package:iqra_wa_irtaqi/features/authentication/repositories/authentication_repository.dart';
import 'package:iqra_wa_irtaqi/features/institutes/cubits/institute/institute_cubit.dart';
import 'package:iqra_wa_irtaqi/features/institutes/cubits/institutes/institutes_cubit.dart';
import 'package:iqra_wa_irtaqi/features/institutes/repositories/institutes_repository.dart';
import 'package:iqra_wa_irtaqi/features/snackbar/bloc/snackbar_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerFactory<SnackbarBloc>(() => SnackbarBloc());
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt()));
  getIt.registerFactory<AuthenticationRepository>(
    () => AuthenticationRepository(),
  );

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<PasswordResetCubit>(() => PasswordResetCubit(getIt()));

  getIt.registerFactory<InstituteCubit>(() => InstituteCubit(getIt()));
  getIt.registerFactory<InstitutesCubit>(() => InstitutesCubit(getIt()));
  getIt.registerFactory<InstitutesRepository>(() => InstitutesRepository());
}
