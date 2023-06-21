import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_messaging/features/auth/controllers/helper_controller.dart';
import 'package:firebase_cloud_messaging/features/auth/models/user__model.dart';
import 'package:firebase_cloud_messaging/features/auth/screens/welcome/welcome_screen.dart';
import 'package:firebase_cloud_messaging/repository/auth_repository/authentication_repository.dart';
import 'package:firebase_cloud_messaging/repository/auth_repository/exceptions/t_exceptions.dart';
import 'package:firebase_cloud_messaging/repository/user_repository/user_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

// Get user email and pass to UserRepository to fetch user record
  getUserData() {
    final email = _authRepo.firebaseUser?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Helper.errorSnackBar(title: 'Error', message: 'Please login to continue');
    }
  }

// Fetch list of all user records
  Future<List<UserModel>> getAllUsers() async => await _userRepo.allUser();

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }

// Logging out
  Future<void> logout() async {
    try {
      // Sign out from various authentication providers
      // await GoogleSignIn().signOut();
      // await FacebookAuth.instance.logOut();
      await FirebaseAuth.instance.signOut();

      // Navigate to the WelcomeScreen and close all previous screens
      Get.offAll(() => WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = TExceptions.fromCode(e.code);
      throw ex.message;
    } catch (error, stackTrace) {
      print('Logout Error: $error');
      print('Stack Trace: $stackTrace');
      const ex = TExceptions();
      throw ex.message;
    }
  }
}
