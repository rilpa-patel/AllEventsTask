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
    apiKey: 'AIzaSyAxEfKzSZAvl56YUbaDabpkpqWuu3y8ik4',
    appId: '1:699257508142:web:d6b087af2a2ed297006abf',
    messagingSenderId: '699257508142',
    projectId: 'allevents-368d8',
    authDomain: 'allevents-368d8.firebaseapp.com',
    storageBucket: 'allevents-368d8.appspot.com',
    measurementId: 'G-V0YR1MJT7N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD-NplueJDdx153Vvnn542NoSqafL_20EA',
    appId: '1:699257508142:android:70857a3807d80470006abf',
    messagingSenderId: '699257508142',
    projectId: 'allevents-368d8',
    storageBucket: 'allevents-368d8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCnGnAKWtb2UVIXWZ53jFskfAgdtIDJUyc',
    appId: '1:699257508142:ios:e7914ee6a574c852006abf',
    messagingSenderId: '699257508142',
    projectId: 'allevents-368d8',
    storageBucket: 'allevents-368d8.appspot.com',
    iosBundleId: 'com.example.allevents',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCnGnAKWtb2UVIXWZ53jFskfAgdtIDJUyc',
    appId: '1:699257508142:ios:c946c5364d902a08006abf',
    messagingSenderId: '699257508142',
    projectId: 'allevents-368d8',
    storageBucket: 'allevents-368d8.appspot.com',
    iosBundleId: 'com.example.allevents.RunnerTests',
  );
}
