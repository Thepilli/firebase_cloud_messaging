import 'package:firebase_cloud_messaging/common_widgets/fade_in_animation/animation_design.dart';
import 'package:firebase_cloud_messaging/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:firebase_cloud_messaging/common_widgets/fade_in_animation/fade_in_animation_model_controller.dart';
import 'package:firebase_cloud_messaging/constants/colors.dart';
import 'package:firebase_cloud_messaging/constants/images_strings.dart';
import 'package:firebase_cloud_messaging/constants/text_strings.dart';
import 'package:firebase_cloud_messaging/features/auth/screens/login/login_screen.dart';
import 'package:firebase_cloud_messaging/features/auth/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_cloud_messaging/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:firebase_cloud_messaging/features/core/dashboard/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  // anonymous sign-in function
  void loginAnonym() async {
    // show loading circle

    // sign in anonymously
    await FirebaseAuth.instance.signInAnonymously();
    print(FirebaseAuth.instance.currentUser);
    await Get.to(() => Dashboard());

    // pop loading circle
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();

    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
      body: Stack(
        children: [
          TFadeInAnimation(
            durationInMs: 1200,
            animate: TAnimatePosition(
                bottomAfter: 0,
                bottomBefore: -100,
                rightAfter: 0,
                rightBefore: 0,
                leftAfter: 0,
                leftBefore: 0,
                topAfter: 0,
                topBefore: 0),
            child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                    tag: 'welcome-image-tag',
                    child: Image(image: const AssetImage(tWelcomeScreenImage), height: height * 0.6),
                  ),
                  Column(
                    children: [
                      Text(tWelcomeTitle, style: Theme.of(context).textTheme.displaySmall),
                      Text(tWelcomeSubTitle, style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            Get.to(() => LoginScreen());
                          },
                          child: Text(tLogin.toUpperCase()),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => SignUpScreen());
                          },
                          child: Text(tSignup.toUpperCase()),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Wanna give it a try?',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: loginAnonym,
                        child: const Text('Continue anonymously',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
