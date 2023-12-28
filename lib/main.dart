import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:main/data/services/query/subsclass_maps.dart';
import 'package:main/injector.dart' as di;
import 'package:main/route/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();

  runApp(const MyApp());
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Sahambagger',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
