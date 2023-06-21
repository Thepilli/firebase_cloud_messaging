import 'package:firebase_cloud_messaging/constants/sizes.dart';
import 'package:firebase_cloud_messaging/constants/text_strings.dart';
import 'package:firebase_cloud_messaging/features/auth/controllers/mail_verification_controller.dart';
import 'package:firebase_cloud_messaging/repository/auth_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MailVerification extends StatelessWidget {
  const MailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MailVerificationController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: tDefaultSize * 5, left: tDefaultSize, right: tDefaultSize, bottom: tDefaultSize * 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.mail, size: 100),
              const SizedBox(height: tDefaultSize * 2),
              Text(tEmailVerificationTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: tDefaultSize),
              Text(
                tEmailVerificationSubTitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ), // Text
              const SizedBox(height: tDefaultSize * 2),
              SizedBox(
                width: 200,
                child: OutlinedButton(
                    child: Text(tContinue), onPressed: () => controller.manuallyCheckEmailVerificationStatus()),
              ), // SizedBox
              const SizedBox(height: tDefaultSize * 2),
              TextButton(
                onPressed: () => controller.sendVerificationEmail(),
                child: Text(tResendEmailLink),
              ), // TextButton
              TextButton(
                onPressed: () => AuthenticationRepository.instance.logout(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.arrow_back),
                    const SizedBox(width: 5),
                    Text(tBackToLogin.toLowerCase()),
                  ],
                ), // Row
              ), // TextButton
            ],
          ), // Column
        ), // Padding
      ), // SingleChildScrollView
    ); // Scaffold
  } // Widget build
}
