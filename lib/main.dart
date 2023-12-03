import 'package:flutter/material.dart';
import 'package:main/screens/onboard_screen.dart';
import 'package:main/screens/profile_screen.dart';
import 'package:main/route/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
          scaffoldBackgroundColor: Colors.white),
      routerConfig: _appRouter.config(),
    );
  }
}
