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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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
    apiKey: 'AIzaSyDaM0NJmx1iwHnZfD3EzzSrJHz1_HczLP0',
    appId: '1:947583067059:android:0d7690507be40f3dc2e1c6',
    messagingSenderId: '947583067059',
    projectId: 'blog-app-a49a5',
    storageBucket: 'blog-app-a49a5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBHriNccdikyrZxYItGYJ2mdDdE-ikMT08',
    appId: '1:947583067059:ios:9fd73b15b576f50cc2e1c6',
    messagingSenderId: '947583067059',
    projectId: 'blog-app-a49a5',
    storageBucket: 'blog-app-a49a5.appspot.com',
    iosBundleId: 'com.example.blogapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBHriNccdikyrZxYItGYJ2mdDdE-ikMT08',
    appId: '1:947583067059:ios:9fd73b15b576f50cc2e1c6',
    messagingSenderId: '947583067059',
    projectId: 'blog-app-a49a5',
    storageBucket: 'blog-app-a49a5.appspot.com',
    iosBundleId: 'com.example.blogapp',
  );
}
