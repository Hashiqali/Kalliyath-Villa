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
    apiKey: 'AIzaSyBva9NPfmr_KzBORjVdRWPhNdjP1MUk4Gk',
    appId: '1:375481856635:web:0a52f907eac070e903a8de',
    messagingSenderId: '375481856635',
    projectId: 'kalliyath-villa-5fb57',
    authDomain: 'kalliyath-villa-5fb57.firebaseapp.com',
    storageBucket: 'kalliyath-villa-5fb57.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCyl31qbFYOnSPqzBnmdAy54dxROY9Le9Q',
    appId: '1:375481856635:android:13cf897e6c36568703a8de',
    messagingSenderId: '375481856635',
    projectId: 'kalliyath-villa-5fb57',
    storageBucket: 'kalliyath-villa-5fb57.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAnMsapKbB_7nGJS_fALdby7jO2Fv0MHAQ',
    appId: '1:375481856635:ios:1dd3713ce8abf84603a8de',
    messagingSenderId: '375481856635',
    projectId: 'kalliyath-villa-5fb57',
    storageBucket: 'kalliyath-villa-5fb57.appspot.com',
    androidClientId:
        '375481856635-osqcp0ebqdssfimrsouql4tiibr3bcpd.apps.googleusercontent.com',
    iosClientId:
        '375481856635-3it52mr41rq2u70lc12t8vsr2t0867kq.apps.googleusercontent.com',
    iosBundleId: 'com.example.kalliyathVilla',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAnMsapKbB_7nGJS_fALdby7jO2Fv0MHAQ',
    appId: '1:375481856635:ios:c21b1855b0f1be1a03a8de',
    messagingSenderId: '375481856635',
    projectId: 'kalliyath-villa-5fb57',
    storageBucket: 'kalliyath-villa-5fb57.appspot.com',
    androidClientId:
        '375481856635-osqcp0ebqdssfimrsouql4tiibr3bcpd.apps.googleusercontent.com',
    iosClientId:
        '375481856635-tejqjad3p41bcflohnmj8df802nm59ll.apps.googleusercontent.com',
    iosBundleId: 'com.example.kalliyathVilla.RunnerTests',
  );
}
