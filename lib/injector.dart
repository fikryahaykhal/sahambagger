import 'package:get_it/get_it.dart';
import 'package:main/bloc/auth/login/login_cubit.dart';
import 'package:main/data/repository/auth_repository.dart';
import 'package:main/domain/repository/auth_repository.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  locator.registerLazySingleton(() => LoginCubit(locator()));
}
