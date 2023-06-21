import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_cloud_messaging/constants/text_strings.dart';
import 'package:firebase_cloud_messaging/features/auth/controllers/helper_controller.dart';
import 'package:firebase_cloud_messaging/features/auth/models/user__model.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

//Store user in Firestore
  Future<void> createUser(UserModel user) async {
    try {
      await _db.collection('Users').add(user.toJson());
      Helper.successSnackBar(title: 'Success', message: 'User created successfully');
    } catch (e) {
      Helper.errorSnackBar(title: tOhSnap, message: e.toString());
    }
  }

  //Fetch a user OR all user details

  Future<UserModel> getUserDetails(String email) async {
    final snapshot = await _db.collection('Users').where('Email', isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection('Users').get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> updateUserRecord(UserModel user) async {
    await _db.collection('Users').doc(user.id).update(user.toJson());
  }
}
