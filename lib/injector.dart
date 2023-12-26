import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:main/bloc/auth/login/login_cubit.dart';
import 'package:main/bloc/auth/register/register_cubit.dart';
import 'package:main/bloc/learning/learning_cubit.dart';
import 'package:main/bloc/user/profile/profile_cubit.dart';
import 'package:main/bloc/user/survey/survey_cubit.dart';
import 'package:main/core/client/config.dart';
import 'package:main/data/datasource/content_data_source.dart';
import 'package:main/data/repository/auth_repository.dart';
import 'package:main/data/repository/content_repositor.dart';
import 'package:main/data/repository/user_repository.dart';
import 'package:main/data/services/content_services.dart';
import 'package:main/data/services/query/object/subscription_object.dart';
import 'package:main/data/services/query/profile_query.dart';
import 'package:main/domain/repository/auth_repository.dart';
import 'package:main/domain/repository/content_repository.dart';
import 'package:main/domain/repository/user_repository.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerLazySingleton(() {
    final dio = createClient(
      dotenv.get('GHOST_API_URL'),
      headers: {'Accept-Version': dotenv.get('GHOST_MAJOR_VERSION')},
      queryParams: {'key': dotenv.get('GHOST_CONTENT_KEY')},
    );

    return ContentServices(dio);
  });

  locator.registerLazySingleton(() => ProfileQuery());
  locator.registerLazySingleton(() => SubscriptionObject());

  locator.registerLazySingleton<ContentRemoteDataSource>(
      () => ContentRemoteDataSourceImpl(locator()));

  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  locator.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  locator.registerLazySingleton<ContentRepository>(
    () => ContentRepositoryImpl(
      locator(),
    ),
  );
}
