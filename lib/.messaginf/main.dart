// import 'package:firebase_cloud_messaging/messaginf/services/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// import 'home_page.dart';
// import 'notification_page.dart';
// import 'services/firebase_api.dart';

// final navigatorKey = GlobalKey<NavigatorState>();

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   await FirebaseApi().initNotifications();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.pink,
//       ),
//       navigatorKey: navigatorKey,
//       home: const HomeScreen(),
//       routes: {
//         NotificationScreen.route: (context) => const NotificationScreen()
//       },
//     );
//   }
// }
