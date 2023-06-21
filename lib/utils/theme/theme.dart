import 'package:firebase_cloud_messaging/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:firebase_cloud_messaging/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:firebase_cloud_messaging/utils/theme/widget_themes/text_theme.dart';
import 'package:firebase_cloud_messaging/utils/theme/widget_themes/text_field_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    // scaffoldBackgroundColor: tPrimaryColor,
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    appBarTheme: const AppBarTheme(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
  );
  static ThemeData darkTheme = ThemeData(
    // scaffoldBackgroundColor: tSecondaryColor,
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    appBarTheme: const AppBarTheme(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
  );
}
