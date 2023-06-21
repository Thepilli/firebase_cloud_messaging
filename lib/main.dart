import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_messaging/features/auth/screens/welcome/welcome_screen.dart';
import 'package:firebase_cloud_messaging/firebase_options.dart';
import 'package:firebase_cloud_messaging/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'repository/auth_repository/authentication_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get Local Storage with GetX
  // TODO Add local storage

  // Await Splash until other items load
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Frebase and Auth repo
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  print('This is the current platform: ${DefaultFirebaseOptions.currentPlatform}');
  print('THIS IS THE CURRENT USER: ${FirebaseAuth.instance.currentUser}');

  // Starts the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: Duration(milliseconds: 500),
      home: WelcomeScreen(),
    );
  }
}
