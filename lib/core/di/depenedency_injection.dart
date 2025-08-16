import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:vezeeto/core/networking/api_service.dart';
import 'package:vezeeto/features/login/data/repo/login_repo.dart';
import 'package:vezeeto/features/login/logic/login_cubit.dart';

import '../../features/sign_up/data/repo/sign_up_repo.dart';
import '../../features/sign_up/logic/sign_up_cubit.dart';
import '../networking/dio_factory.dart';
final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  Dio dio =  DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

}