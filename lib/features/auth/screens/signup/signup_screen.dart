import 'package:firebase_cloud_messaging/common_widgets/social_footer_widget.dart';
import 'package:firebase_cloud_messaging/constants/images_strings.dart';
import 'package:firebase_cloud_messaging/constants/sizes.dart';
import 'package:firebase_cloud_messaging/constants/text_strings.dart';
import 'package:firebase_cloud_messaging/features/auth/screens/signup/signup_form_widget.dart';
import 'package:firebase_cloud_messaging/common_widgets/form_header_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: const [
                FormHeaderWidget(
                  image: tWelcomeScreenImage,
                  title: tSignUpTitle,
                  subTitle: tSignUpSubTitle,
                  imageHeight: 0.15,
                ),
                SignUpFormWidget(),
                SocialFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
