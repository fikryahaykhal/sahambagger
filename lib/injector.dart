import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:main/bloc/auth/login/login_cubit.dart';
import 'package:main/bloc/learning/learning_cubit.dart';
import 'package:main/core/client/config.dart';
import 'package:main/data/datasource/content_data_source.dart';
import 'package:main/data/repository/auth_repository.dart';
import 'package:main/data/repository/content_repositor.dart';
import 'package:main/data/repository/user_repository.dart';
import 'package:main/data/services/content_services.dart';
import 'package:main/data/services/query/profile_query.dart';
import 'package:main/data/services/query/subsclass_maps.dart';
import 'package:main/domain/repository/auth_repository.dart';
import 'package:main/domain/repository/content_repository.dart';
import 'package:main/domain/repository/user_repository.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final locator = GetIt.instance;

Future<void> init() async {
  await dotenv.load(fileName: ".env");

  final keyApplicationId = dotenv.get('PARSE_APP_ID');
  final keyClientKey = dotenv.get('PARSE_CLIENT_KEY');
  final keyParseServerUrl = dotenv.get('PARSE_URL');

  await Parse().initialize(
    keyApplicationId,
    keyParseServerUrl,
    clientKey: keyClientKey,
    autoSendSessionId: true,
    registeredSubClassMap: subsclassMaps,
    parseUserConstructor: (username, password, emailAddress,
            {client, debug, sessionToken}) =>
        ParseUser(username, password, emailAddress),
  );

  final user = await ParseUser.currentUser();

  locator.registerLazySingleton(() {
    final dio = createClient(
      dotenv.get('GHOST_API_URL'),
      headers: {'Accept-Version': dotenv.get('GHOST_MAJOR_VERSION')},
      queryParams: {'key': dotenv.get('GHOST_CONTENT_KEY')},
    );

    return ContentServices(dio);
  });

  locator.registerLazySingleton<ParseUser>(() => user);
  locator.registerLazySingleton(() => ProfileQuery());

  locator.registerLazySingleton<ContentRemoteDataSource>(
      () => ContentRemoteDataSourceImpl(locator()));

  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  locator.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        locator(),
        locator(),
      ));
  locator.registerLazySingleton<ContentRepository>(
      () => ContentRepositoryImpl(locator()));

  locator.registerLazySingleton(() => LoginCubit(locator()));
  locator.registerLazySingleton(() => LearningCubit(locator()));
}
