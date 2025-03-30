import 'package:chat_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: AppColor.primaryLight,
      secondary: AppColor.secondaryLight,
      background: AppColor.backgroundLight,
      surface: AppColor.surfaceLight,
    ),
    scaffoldBackgroundColor: AppColor.backgroundLight,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.primaryLight,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.secondaryLight,
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      bodyMedium: TextStyle(fontSize: 16, color: AppColor.textPrimaryLight),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColor.textFieldBackgroundLight,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide.none,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.bottomNavBackgroundLight,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: AppColor.primaryDark,
      secondary: AppColor.secondaryDark,
      background: AppColor.backgroundDark,
      surface: AppColor.surfaceDark,
    ),
    scaffoldBackgroundColor: AppColor.backgroundDark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.primaryDark,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.secondaryDark,
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: AppColor.textPrimaryGrey,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      bodyMedium: TextStyle(fontSize: 16, color: AppColor.textPrimaryDark),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColor.textFieldBackgroundDark,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide.none,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.bottomNavBackgroundDark,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
    ),

    listTileTheme: ListTileThemeData(
      titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
    ),
  );
}
