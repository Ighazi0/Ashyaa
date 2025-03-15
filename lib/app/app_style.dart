import 'package:flutter/material.dart';

class AppStyle {
  static const primaryColor = Color(0xff229799);
  static const secondryColor = Color(0xff48CFCB);
  static const lightColor = Color(0xffF5F5F5);
  static const darkColor = Color(0xff424242);
  static get borderRadius => BorderRadius.circular(20);

  static const shadow = [
    BoxShadow(spreadRadius: 0.5, blurRadius: 3, color: Colors.black26),
  ];

  static get theme => ThemeData(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(),
    scaffoldBackgroundColor: lightColor,
    colorScheme: const ColorScheme.light(primary: primaryColor),
    iconTheme: IconThemeData(color: Colors.black),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
  );

  static get darkTheme => ThemeData(
    primaryColor: secondryColor,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    scaffoldBackgroundColor: darkColor,
    colorScheme: const ColorScheme.light(primary: secondryColor),
    iconTheme: IconThemeData(color: Colors.white),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
  );
}
