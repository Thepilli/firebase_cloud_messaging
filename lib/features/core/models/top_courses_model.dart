import 'package:flutter/material.dart';

class DashboardCoursesModel {
  final String heading;
  final String title;
  final String subHeading;
  final String image;
  final VoidCallback? onPress;

  DashboardCoursesModel({
    required this.heading,
    required this.title,
    required this.subHeading,
    required this.image,
    required this.onPress,
  });

  static List<DashboardCoursesModel> list = [
    DashboardCoursesModel(
        title: 'JS',
        heading: 'JavaScript',
        subHeading: '10 lessons',
        image: 'assets/images/dashboard/dash-02.png',
        onPress: null),
    DashboardCoursesModel(
        title: 'F',
        heading: 'Flutter',
        subHeading: '11 lessons',
        image: 'assets/images/dashboard/dash-04.png',
        onPress: null),
  ];
}
