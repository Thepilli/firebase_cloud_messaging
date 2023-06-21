// // ignore_for_file: prefer_const_constructors, avoid_print

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_cloud_messaging/messaginf/main.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// import '../notification_page.dart';

// @pragma('vm:entry-point')
// Future<void> handleBackgroundMessage(RemoteMessage message) async {
//   print('title: ${message.notification?.title}');
//   print('body: ${message.notification?.body}');
//   print('Payload: ${message.data}');
// }

// void handleMessage(RemoteMessage? message) {
//   if (message == null) return;
//   navigatorKey.currentState?.pushNamed(
//     NotificationScreen.route,
//     arguments: message,
//   );
// }

// Future initPushNotifications() async {
//   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//     alert: true,
//     badge: true,
//     sound: true,
//   );
//   FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
//   FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//   FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
// }

// class FirebaseApi {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//   String? mtoken = '';

//   Future<void> initNotifications() async {
//     NotificationSettings settings = await _firebaseMessaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print('User granted permission');
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       print('user granted provisional permission');
//     } else {
//       print('user declined or has not accepted permission');
//     }

//     String? token = await FirebaseMessaging.instance.getToken();
//     mtoken = token;
//     print('token: $mtoken');
//     saveToken(token!);
//     initPushNotifications();
//   }

//   Future<void> saveToken(String token) async {
//     await FirebaseFirestore.instance.collection('UserTokens').doc('User1').set({
//       'token': token,
//     });
//   }

//   FirebaseApi() {
//     initNotifications();

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       print('..........onMessage: ........');
//       print(
//           'onMessage: ${message.notification?.title}/${message.notification?.body})');
//     });
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//       print('..........onMessageOpenedApp: ........');
//       print(
//           'onMessageOpenedApp: ${message.notification?.title}/${message.notification?.body})');
//     });
//   }
// }
