import 'package:chat_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: AppColor.primaryLight,
      secondary: AppColor.secondaryLight,
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

    //ColorScheme
    colorScheme: ColorScheme.dark(
      primary: AppColor.secondaryDark,
      secondary: AppColor.primaryDark,
      surface: AppColor.surfaceDark,
    ),

    //Scaffold
    scaffoldBackgroundColor: AppColor.backgroundDark,

    //AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.backgroundDark,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.surfaceLight,
      ),
    ),

    //FloatingActionButton
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.secondaryDark,
      foregroundColor: Colors.white,
    ),

    //Text
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: AppColor.textPrimaryGrey,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      bodyMedium: TextStyle(fontSize: 16, color: AppColor.textPrimaryDark),
    ),

    //InputDecoration
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColor.textFieldBackgroundDark,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: BorderSide.none,
      ),
    ),

    //BottomNavigationBar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.bottomNavBackgroundDark,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
    ),

    //ListTile
    listTileTheme: ListTileThemeData(
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 17,
        color: AppColor.surfaceLight,
      ),
    ),

    //ElevatedButton
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.secondaryDark,
        foregroundColor: Colors.white,
      ),
    ),

    //OutlinedButton
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        // backgroundColor: AppColor.secondaryDark,
        foregroundColor: AppColor.secondaryDark,
        side: BorderSide(color: AppColor.secondaryDark),
      ),
    ),
  );
}
