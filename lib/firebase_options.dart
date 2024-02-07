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
    apiKey: 'AIzaSyBR1jEA2OuZw42QOhr5VFyrbi9Y6KJgGr0',
    appId: '1:674828250035:web:be7b4b6cfc05e44778f9c6',
    messagingSenderId: '674828250035',
    projectId: 'ownotes-flutter-project',
    authDomain: 'ownotes-flutter-project.firebaseapp.com',
    storageBucket: 'ownotes-flutter-project.appspot.com',
    measurementId: 'G-TM812N9P4M',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCQ-RvnoE1iyYi2PUNDrR6ePXzWbvlYfhg',
    appId: '1:674828250035:android:059c1d46cec5655078f9c6',
    messagingSenderId: '674828250035',
    projectId: 'ownotes-flutter-project',
    storageBucket: 'ownotes-flutter-project.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDFsMUejYEkNaJzZAZiWZTewBcBxHIItvo',
    appId: '1:674828250035:ios:8f893afdfda48c7b78f9c6',
    messagingSenderId: '674828250035',
    projectId: 'ownotes-flutter-project',
    storageBucket: 'ownotes-flutter-project.appspot.com',
    iosClientId: '674828250035-qhj99qkcpk05pooftfggvul9nnth082c.apps.googleusercontent.com',
    iosBundleId: 'com.taci.ownotes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDFsMUejYEkNaJzZAZiWZTewBcBxHIItvo',
    appId: '1:674828250035:ios:8f893afdfda48c7b78f9c6',
    messagingSenderId: '674828250035',
    projectId: 'ownotes-flutter-project',
    storageBucket: 'ownotes-flutter-project.appspot.com',
    iosClientId: '674828250035-qhj99qkcpk05pooftfggvul9nnth082c.apps.googleusercontent.com',
    iosBundleId: 'com.taci.ownotes',
  );
}
