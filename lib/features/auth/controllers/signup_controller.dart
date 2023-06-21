import 'package:firebase_cloud_messaging/constants/text_strings.dart';
import 'package:firebase_cloud_messaging/features/auth/controllers/helper_controller.dart';
import 'package:firebase_cloud_messaging/features/auth/models/user__model.dart';
import 'package:firebase_cloud_messaging/repository/auth_repository/authentication_repository.dart';
import 'package:firebase_cloud_messaging/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextField Controllers to get data from TextFields
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());

//loader
  final isLoading = false.obs;

  // Register new user with email and password OR phone number authentication

  Future<void> createUser(UserModel user) async {
    try {
      if (signUpFormKey.currentState != null && !signUpFormKey.currentState!.validate()) {
        isLoading.value = false;
        return;
      }

      final user = UserModel(
        email: email.text.trim(),
        password: password.text.trim(),
        fullName: fullName.text.trim(),
        phoneNo: phoneNo.text.trim(),
      );

      final auth = AuthenticationRepository.instance;
      await auth.createUserWithEmailAndPassword(user.email, user.password);
      await UserRepository.instance.createUser(user);
      auth.setInitialScreen(auth.firebaseUser);
    } catch (e) {
      isLoading.value = false;
      Helper.errorSnackBar(title: tOhSnap, message: e.toString());
    }
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    try {
      await AuthenticationRepository.instance.phoneAuthentication(phoneNo);
    } catch (e) {
      throw e.toString();
    }
  }
}
