import 'package:firebase_cloud_messaging/common_widgets/social_footer_widget.dart';
import 'package:firebase_cloud_messaging/constants/sizes.dart';
import 'package:firebase_cloud_messaging/features/auth/screens/login/login_form_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                // FormHeaderWidget(
                //   image: tWelcomeScreenImage,
                //   title: tLoginTitle,
                //   subTitle: tLoginSubTitle,
                //   imageHeight: 0.15,
                // ),
                LoginForm(),
                SocialFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
