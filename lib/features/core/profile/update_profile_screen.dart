import 'package:firebase_cloud_messaging/constants/colors.dart';
import 'package:firebase_cloud_messaging/constants/images_strings.dart';
import 'package:firebase_cloud_messaging/constants/sizes.dart';
import 'package:firebase_cloud_messaging/constants/text_strings.dart';
import 'package:firebase_cloud_messaging/features/auth/models/user__model.dart';
import 'package:firebase_cloud_messaging/features/core/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({super.key});
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    var isDark = Get.isDarkMode;
    var iconColor = isDark ? tPrimaryColor : tAccentColor;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text(tProfile, style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          IconButton(
              onPressed: () {
                Get.changeThemeMode(isDark ? ThemeMode.light : ThemeMode.dark);
              },
              icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(tDefaultSize),
          // Future builder to load cloud data
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data as UserModel;
                  final id = TextEditingController(text: userData.id);

                  final email = TextEditingController(text: userData.email);
                  final password = TextEditingController(text: userData.password);
                  final fullName = TextEditingController(text: userData.fullName);
                  final phoneNo = TextEditingController(text: userData.phoneNo);

                  return Column(
                    children: [
                      //Image with icon
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child:
                                  Container(color: iconColor.withAlpha(50), child: Image(image: AssetImage(tProfileImage))),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: tPrimaryColor,
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.black,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),

                      //Form fields
                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: fullName,
                              decoration: const InputDecoration(
                                  label: Text(tFullName), prefixIcon: Icon(Icons.person_outline_rounded)),
                            ),
                            const SizedBox(height: tFormHeight - 20),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              enabled: false,
                              controller: email,
                              decoration: InputDecoration(
                                  label: Text(tEmail),
                                  prefixIcon: Icon(Icons.email_outlined),
                                  filled: true,
                                  fillColor: tPrimaryColor.withOpacity(0.1)),
                            ),
                            const SizedBox(height: tFormHeight - 20),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: phoneNo,
                              decoration: const InputDecoration(label: Text(tPhoneNo), prefixIcon: Icon(Icons.numbers)),
                            ),
                            const SizedBox(height: tFormHeight - 20),
                            TextFormField(
                              controller: password,
                              obscureText: true,
                              decoration: const InputDecoration(label: Text(tPassword), prefixIcon: Icon(Icons.fingerprint)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: tFormHeight),

                      //Form submit button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            final userData = UserModel(
                              id: id.text,
                              email: email.text.trim(),
                              password: password.text.trim(),
                              fullName: fullName.text.trim(),
                              phoneNo: phoneNo.text.trim(),
                            );
                            await controller.updateRecord(userData);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: tPrimaryColor,
                            side: BorderSide.none,
                            shape: StadiumBorder(),
                          ),
                          child: Text(tEditProfile, style: TextStyle(color: tDarkColor)),
                        ),
                      ),
                      const SizedBox(height: tFormHeight),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(TextSpan(text: tJoined, style: TextStyle(fontSize: 12), children: [
                            TextSpan(text: tJoinedAt, style: TextStyle(fontSize: 12)),
                          ])),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(tDelete),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent.withOpacity(0.1),
                                elevation: 0,
                                foregroundColor: Colors.red,
                                shape: StadiumBorder(),
                                side: BorderSide.none),
                          )
                        ],
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return Center(child: Text('Something went wrong'));
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
