import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_messaging/common_widgets/form_header_widget.dart';
import 'package:firebase_cloud_messaging/common_widgets/social_footer_widget.dart';
import 'package:firebase_cloud_messaging/constants/images_strings.dart';
import 'package:firebase_cloud_messaging/constants/sizes.dart';
import 'package:firebase_cloud_messaging/constants/text_strings.dart';
import 'package:firebase_cloud_messaging/features/auth/screens/login/login_form_widget.dart';
import 'package:firebase_cloud_messaging/features/core/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
// anonymous sign-in function
  void loginAnonym() async {
    // show loading circle

    // sign in anonymously
    await FirebaseAuth.instance.signInAnonymously();
    await Get.to(() => Dashboard());

    // pop loading circle
  }

  @override
  Widget build(BuildContext context) {
    //Get the size in LoginHeaderWidget()
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeaderWidget(
                  image: tWelcomeScreenImage,
                  title: tLoginTitle,
                  subTitle: tLoginSubTitle,
                  imageHeight: 0.15,
                ),
                LoginForm(),
                SocialFooterWidget(),
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
      ),
    );
  }
}
