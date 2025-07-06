import 'package:get_it/get_it.dart';
import 'package:iqra_wa_irtaqi/features/authentication/cubits/login/login_cubit.dart';
import 'package:iqra_wa_irtaqi/features/authentication/cubits/password_reset/password_reset_cubit.dart';
import 'package:iqra_wa_irtaqi/features/authentication/cubits/register/register_cubit.dart';
import 'package:iqra_wa_irtaqi/features/authentication/repositories/authentication_repository.dart';
import 'package:iqra_wa_irtaqi/features/mosques/cubits/mosque/mosque_cubit.dart';
import 'package:iqra_wa_irtaqi/features/mosques/cubits/mosques/mosques_cubit.dart';
import 'package:iqra_wa_irtaqi/features/mosques/repositories/mosques_repository.dart';
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

  getIt.registerFactory<MosqueCubit>(() => MosqueCubit(getIt()));
  getIt.registerFactory<MosquesCubit>(() => MosquesCubit(getIt()));
  getIt.registerFactory<MosquesRepository>(() => MosquesRepository());
}
