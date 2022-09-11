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
    apiKey: 'AIzaSyCXLg5gXye_krVdWMrWsm6YEBUUwSfLly4',
    appId: '1:729661749841:web:0bdd0a4928ee415f7bd670',
    messagingSenderId: '729661749841',
    projectId: 'final-location-9dedc',
    authDomain: 'final-location-9dedc.firebaseapp.com',
    storageBucket: 'final-location-9dedc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC9xz2BhuHzB_-wWqOaSqNui_pghCM2S5M',
    appId: '1:729661749841:android:94e3a39d4c4b5b2f7bd670',
    messagingSenderId: '729661749841',
    projectId: 'final-location-9dedc',
    storageBucket: 'final-location-9dedc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAKeXDsi_bViYyzmscq9G9lxWWi8RS9sHk',
    appId: '1:729661749841:ios:1219c37f94e11dfb7bd670',
    messagingSenderId: '729661749841',
    projectId: 'final-location-9dedc',
    storageBucket: 'final-location-9dedc.appspot.com',
    iosClientId: '729661749841-9bv98uetvmfh0sevc20i2fp2riakpvbk.apps.googleusercontent.com',
    iosBundleId: 'com.example.locationFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAKeXDsi_bViYyzmscq9G9lxWWi8RS9sHk',
    appId: '1:729661749841:ios:1219c37f94e11dfb7bd670',
    messagingSenderId: '729661749841',
    projectId: 'final-location-9dedc',
    storageBucket: 'final-location-9dedc.appspot.com',
    iosClientId: '729661749841-9bv98uetvmfh0sevc20i2fp2riakpvbk.apps.googleusercontent.com',
    iosBundleId: 'com.example.locationFlutter',
  );
}
