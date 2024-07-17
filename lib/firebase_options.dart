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
    apiKey: 'AIzaSyBsKPC_YODk6xnAk5_zGVLFfAiM-7PaVNE',
    appId: '1:434102242075:web:cc56749bf63759255aa1be',
    messagingSenderId: '434102242075',
    projectId: 'social-media-app-fdff9',
    authDomain: 'social-media-app-fdff9.firebaseapp.com',
    storageBucket: 'social-media-app-fdff9.appspot.com',
    measurementId: 'G-485DT4Y5PV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCJwnwYg1ijf7fLMV2Ys5ey2kRSpgQd22E',
    appId: '1:434102242075:android:ba7c10531c5add545aa1be',
    messagingSenderId: '434102242075',
    projectId: 'social-media-app-fdff9',
    storageBucket: 'social-media-app-fdff9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC7AXyoyRQBORNd5Rkc3rsrpJkGqcVQwoo',
    appId: '1:434102242075:ios:f0ac3537544933575aa1be',
    messagingSenderId: '434102242075',
    projectId: 'social-media-app-fdff9',
    storageBucket: 'social-media-app-fdff9.appspot.com',
    iosBundleId: 'com.example.socialMedia',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC7AXyoyRQBORNd5Rkc3rsrpJkGqcVQwoo',
    appId: '1:434102242075:ios:f0ac3537544933575aa1be',
    messagingSenderId: '434102242075',
    projectId: 'social-media-app-fdff9',
    storageBucket: 'social-media-app-fdff9.appspot.com',
    iosBundleId: 'com.example.socialMedia',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBsKPC_YODk6xnAk5_zGVLFfAiM-7PaVNE',
    appId: '1:434102242075:web:467811e7c06b75545aa1be',
    messagingSenderId: '434102242075',
    projectId: 'social-media-app-fdff9',
    authDomain: 'social-media-app-fdff9.firebaseapp.com',
    storageBucket: 'social-media-app-fdff9.appspot.com',
    measurementId: 'G-F4ESQHTE1H',
  );
}
