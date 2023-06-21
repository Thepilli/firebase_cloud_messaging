import 'package:firebase_cloud_messaging/features/core/dashboard/dashboard.dart';
import 'package:firebase_cloud_messaging/repository/auth_repository/authentication_repository.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(() => Dashboard()) : Get.back();
  }
}
