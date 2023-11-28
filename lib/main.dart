import 'package:flutter/material.dart';
import 'package:main/screens/dashboard_screen.dart';
import 'package:main/screens/learning_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sahambagger',
      theme: ThemeData(
          primaryColor: Colors.deepPurple,
          scaffoldBackgroundColor: Colors.white),
      home: const LearningScreen(),
    );
  }
}
