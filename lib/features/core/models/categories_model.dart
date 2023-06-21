import 'package:flutter/material.dart';

class DashboardCategoriesModel {
  final String heading;
  final String title;
  final String subHeading;
  final VoidCallback? onPress;

  DashboardCategoriesModel({
    required this.heading,
    required this.title,
    required this.subHeading,
    required this.onPress,
  });

  static List<DashboardCategoriesModel> list = [
    DashboardCategoriesModel(
        title: 'JS',
        heading: 'JavaScript',
        subHeading: '10 lessons',
        onPress: null),
    DashboardCategoriesModel(
        title: 'F',
        heading: 'Flutter',
        subHeading: '11 lessons',
        onPress: null),
    DashboardCategoriesModel(
        title: 'H', heading: 'HTML', subHeading: '8 lessons', onPress: null),
    DashboardCategoriesModel(
        title: 'K', heading: 'Kotlin', subHeading: '20 lessons', onPress: null),
    DashboardCategoriesModel(
        title: 'P',
        heading: 'Python',
        subHeading: '100 lessons',
        onPress: null),
  ];
}
