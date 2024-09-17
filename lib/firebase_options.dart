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
    apiKey: 'AIzaSyCrH728ViKSDYIszCy67OkXt6ioa0YVP-c',
    appId: '1:673256648044:web:88125066dcd0314e1c9749',
    messagingSenderId: '673256648044',
    projectId: 'sharefileiai',
    authDomain: 'sharefileiai.firebaseapp.com',
    storageBucket: 'sharefileiai.appspot.com',
    measurementId: 'G-8M18MTQVRP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBBqg4JRsOgUDlUYvJESmLL5soS5MskMG0',
    appId: '1:673256648044:android:72097909e0ad04351c9749',
    messagingSenderId: '673256648044',
    projectId: 'sharefileiai',
    storageBucket: 'sharefileiai.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDf1wc1oEizgqgOwxA9llpgY_0USVu1uSE',
    appId: '1:673256648044:ios:8a0e58c22f256ab31c9749',
    messagingSenderId: '673256648044',
    projectId: 'sharefileiai',
    storageBucket: 'sharefileiai.appspot.com',
    iosBundleId: 'com.example.shareFileIai',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDf1wc1oEizgqgOwxA9llpgY_0USVu1uSE',
    appId: '1:673256648044:ios:8a0e58c22f256ab31c9749',
    messagingSenderId: '673256648044',
    projectId: 'sharefileiai',
    storageBucket: 'sharefileiai.appspot.com',
    iosBundleId: 'com.example.shareFileIai',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCrH728ViKSDYIszCy67OkXt6ioa0YVP-c',
    appId: '1:673256648044:web:550e47d26fcd33db1c9749',
    messagingSenderId: '673256648044',
    projectId: 'sharefileiai',
    authDomain: 'sharefileiai.firebaseapp.com',
    storageBucket: 'sharefileiai.appspot.com',
    measurementId: 'G-FZ97XDTPDH',
  );
}
