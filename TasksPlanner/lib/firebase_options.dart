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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCtEsK2ESBULyQA4qvpzfA91Z6i59gRtjw',
    appId: '1:152372488840:android:dc927a00b81c8198ad0d3d',
    messagingSenderId: '152372488840',
    projectId: 'to-do-sylviezhang',
    storageBucket: 'to-do-sylviezhang.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBsnIfe5OoPEx0Us8W77uIVe9p5hzuPtu8',
    appId: '1:152372488840:ios:20935155a8bb1510ad0d3d',
    messagingSenderId: '152372488840',
    projectId: 'to-do-sylviezhang',
    storageBucket: 'to-do-sylviezhang.appspot.com',
    iosBundleId: 'com.sylviezhang.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBsnIfe5OoPEx0Us8W77uIVe9p5hzuPtu8',
    appId: '1:152372488840:ios:197513524822989bad0d3d',
    messagingSenderId: '152372488840',
    projectId: 'to-do-sylviezhang',
    storageBucket: 'to-do-sylviezhang.appspot.com',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBOc8mDqJiUiGBuZDaojB_oi2klMkp1vlw',
    appId: '1:152372488840:web:193c361bc0c513bdad0d3d',
    messagingSenderId: '152372488840',
    projectId: 'to-do-sylviezhang',
    authDomain: 'to-do-sylviezhang.firebaseapp.com',
    storageBucket: 'to-do-sylviezhang.appspot.com',
  );

}