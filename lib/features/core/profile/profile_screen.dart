import 'package:firebase_cloud_messaging/constants/colors.dart';
import 'package:firebase_cloud_messaging/constants/images_strings.dart';

import 'package:firebase_cloud_messaging/constants/sizes.dart';
import 'package:firebase_cloud_messaging/constants/text_strings.dart';
import 'package:firebase_cloud_messaging/features/core/controllers/profile_controller.dart';
import 'package:firebase_cloud_messaging/features/core/profile/profile_menu_widget.dart';
import 'package:firebase_cloud_messaging/features/core/profile/update_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
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
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(color: iconColor.withAlpha(50), child: Image(image: AssetImage(tProfileImage))),
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
              SizedBox(height: 10),
              Text(tProfileHeading, style: Theme.of(context).textTheme.headlineMedium),
              Text(tProfileSubHeading, style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 10),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => UpdateProfileScreen()),
                  child: Text(tEditProfile, style: TextStyle(color: tDarkColor)),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: tPrimaryColor, side: BorderSide.none, shape: StadiumBorder()),
                ),
              ),
              SizedBox(height: 30),
              Divider(),
              SizedBox(height: 10),
              ProfileMenuWidget(title: tMenu1, icon: Icons.settings, onPress: () {}),
              ProfileMenuWidget(title: tMenu2, icon: Icons.wallet, onPress: () {}),
              ProfileMenuWidget(title: tMenu3, icon: Icons.manage_accounts, onPress: () {}),
              Divider(),
              ProfileMenuWidget(title: tMenu4, icon: Icons.info, onPress: () {}),
              ProfileMenuWidget(
                  textColor: Colors.red,
                  title: tMenu5,
                  icon: Icons.logout,
                  onPress: () => controller.logout(),
                  endIcon: false)
            ],
          ),
        ),
      ),
    );
  }
}
