import 'package:firebase_cloud_messaging/common_widgets/social_button.dart';
import 'package:firebase_cloud_messaging/constants/colors.dart';
import 'package:firebase_cloud_messaging/constants/images_strings.dart';
import 'package:firebase_cloud_messaging/constants/sizes.dart';
import 'package:firebase_cloud_messaging/constants/text_strings.dart';
import 'package:firebase_cloud_messaging/features/auth/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialFooterWidget extends StatelessWidget {
  const SocialFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Container(
      padding: const EdgeInsets.only(top: tDefaultSize * 0.5, bottom: tDefaultSize),
      child: Column(
        children: [
          const Text("------------OR------------"),
          const SizedBox(height: tFormHeight),
          Obx(
            () => TSocialButton(
              image: tGoogleLogoImage,
              background: tGoogleBgColor,
              foreground: tGoogleForegroundColor,
              text: '${tConnectWith} ${tGoogle}',
              isLoading: controller.isGoogleLoading.value ? true : false,
              onPressed: controller.isFacebookLoading.value || controller.isLoading.value
                  ? () {}
                  : controller.isGoogleLoading.value
                      ? () {}
                      : () => controller.googleSignIn(),
            ),
          ),
          const SizedBox(height: 10),
          // Obx(
          //   () => TSocialButton(
          //     image: tFacebookLogo,
          //     background: tFacebookBgColor,
          //     foreground: tWhiteColor,
          //     text: '${tConnectWith} ${tFacebook}',
          //     isLoading: controller.isGoogleLoading.value ? true : false,
          //     onPressed: controller.isFacebookLoading.value || controller.isLoading.value
          //         ? () {}
          //         : controller.isFacebookLoading.value
          //             ? () {}
          //             : () => controller.facebookSignIn(),
          //   ),
          // ),
          // const SizedBox(height: 10),
        ],
      ),
    );
  }
}
