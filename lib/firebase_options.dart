// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBtc5diN5EFkkaeemPNVZZhhYTzfVvbHkg',
    appId: '1:457871454042:web:0007114e1bc330b8494d63',
    messagingSenderId: '457871454042',
    projectId: 'movie-app-81088',
    authDomain: 'movie-app-81088.firebaseapp.com',
    storageBucket: 'movie-app-81088.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBb4xWG1abS7bSGuN9eSUxZnk3EoTufuBs',
    appId: '1:457871454042:android:aa6e4770c64c6f80494d63',
    messagingSenderId: '457871454042',
    projectId: 'movie-app-81088',
    storageBucket: 'movie-app-81088.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5ieWgbVd0XB6CRJ1gtMhjzSrMbX7_LEA',
    appId: '1:457871454042:ios:790065df0825589b494d63',
    messagingSenderId: '457871454042',
    projectId: 'movie-app-81088',
    storageBucket: 'movie-app-81088.firebasestorage.app',
    iosBundleId: 'com.example.movieApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC5ieWgbVd0XB6CRJ1gtMhjzSrMbX7_LEA',
    appId: '1:457871454042:ios:790065df0825589b494d63',
    messagingSenderId: '457871454042',
    projectId: 'movie-app-81088',
    storageBucket: 'movie-app-81088.firebasestorage.app',
    iosBundleId: 'com.example.movieApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBtc5diN5EFkkaeemPNVZZhhYTzfVvbHkg',
    appId: '1:457871454042:web:91f824d8cf75596a494d63',
    messagingSenderId: '457871454042',
    projectId: 'movie-app-81088',
    authDomain: 'movie-app-81088.firebaseapp.com',
    storageBucket: 'movie-app-81088.firebasestorage.app',
  );

}