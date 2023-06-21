import 'package:firebase_cloud_messaging/constants/colors.dart';
import 'package:firebase_cloud_messaging/constants/images_strings.dart';
import 'package:firebase_cloud_messaging/constants/sizes.dart';
import 'package:firebase_cloud_messaging/constants/text_strings.dart';
import 'package:firebase_cloud_messaging/features/core/dashboard/banners.dart';
import 'package:firebase_cloud_messaging/features/core/dashboard/categories.dart';
import 'package:firebase_cloud_messaging/features/core/dashboard/top_courses.dart';
import 'package:firebase_cloud_messaging/features/core/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.menu,
          //For Dark Color
          color: isDarkMode ? tWhiteColor : tDarkColor,
        ),
        title: Text(tAppName, style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //For Dark Color
              color: isDarkMode ? tSecondaryColor : tCardBgColor,
            ),
            child: IconButton(
                onPressed: () => Get.to(() => ProfileScreen()), icon: const Image(image: AssetImage(tUserProfileImage))),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(tDashboardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tDashboardTitle, style: Theme.of(context).textTheme.bodyMedium),
              Text(tDashboardHeading, style: Theme.of(context).textTheme.displayMedium),
              SizedBox(height: tDashboardPadding),
              Container(
                decoration: const BoxDecoration(border: Border(left: BorderSide(width: 4))),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(tDashboardSearch,
                        style: Theme.of(context).textTheme.displayMedium?.apply(color: Colors.grey.withOpacity(0.5))),
                    SizedBox(height: tDashboardPadding),
                    const Icon(Icons.mic, size: 25),
                  ],
                ),
              ),
              DashboardCategories(),
              SizedBox(height: tDashboardPadding),
              DashboardBanners(),
              SizedBox(height: tDashboardPadding),
              DashboardCourses(),
              SizedBox(height: tDashboardPadding),
            ],
          ),
        ),
      ),
    );
  }
}
