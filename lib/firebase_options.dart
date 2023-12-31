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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBXD1E35pVOZ2TwN4ypTyiVDTO8Ljv9iPc',
    appId: '1:324989517653:web:ca82f87b2c0bddb7a339dc',
    messagingSenderId: '324989517653',
    projectId: 'fir-cloud-messaging-fa717',
    authDomain: 'fir-cloud-messaging-fa717.firebaseapp.com',
    storageBucket: 'fir-cloud-messaging-fa717.appspot.com',
    measurementId: 'G-G007TYDS58',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBoDGvO7P72JGvU7JSvo9ZOG19be3hY8j8',
    appId: '1:324989517653:android:8e495b742dde0ab8a339dc',
    messagingSenderId: '324989517653',
    projectId: 'fir-cloud-messaging-fa717',
    storageBucket: 'fir-cloud-messaging-fa717.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_n3HgSTge0eef2HbVUMqIfL0qc2cbqJs',
    appId: '1:324989517653:ios:e985adbe79237522a339dc',
    messagingSenderId: '324989517653',
    projectId: 'fir-cloud-messaging-fa717',
    storageBucket: 'fir-cloud-messaging-fa717.appspot.com',
    androidClientId: '324989517653-huk3edh2os9p7ah2vjsks2s14brntfhq.apps.googleusercontent.com',
    iosClientId: '324989517653-4nm0freao89qgf5lcva2699reu270g9k.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseCloudMessaging',
  );
}
