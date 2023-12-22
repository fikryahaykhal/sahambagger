// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC-jRaSsAdu-j0XwgBclTB7b143Ii5kEHo',
    appId: '1:694242452251:web:0260e9ec9062bba942a9be',
    messagingSenderId: '694242452251',
    projectId: 'sahambagger-5c1a3',
    authDomain: 'sahambagger-5c1a3.firebaseapp.com',
    storageBucket: 'sahambagger-5c1a3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBadAoNmebcpidoeP0SI_zYVYfU7hQSi4w',
    appId: '1:694242452251:android:e209c9659942fdd042a9be',
    messagingSenderId: '694242452251',
    projectId: 'sahambagger-5c1a3',
    storageBucket: 'sahambagger-5c1a3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCll3JjxFh5x4zY7GANHQkc0gmm_UbRiAU',
    appId: '1:694242452251:ios:d4f3b33dcfb7adaa42a9be',
    messagingSenderId: '694242452251',
    projectId: 'sahambagger-5c1a3',
    storageBucket: 'sahambagger-5c1a3.appspot.com',
    iosBundleId: 'com.example.main',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCll3JjxFh5x4zY7GANHQkc0gmm_UbRiAU',
    appId: '1:694242452251:ios:2d7a56c09d04c52d42a9be',
    messagingSenderId: '694242452251',
    projectId: 'sahambagger-5c1a3',
    storageBucket: 'sahambagger-5c1a3.appspot.com',
    iosBundleId: 'com.example.main.RunnerTests',
  );
}