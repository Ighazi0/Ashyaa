import 'package:flutter/material.dart';

class AppStyle {
  static const primaryColor = Color(0xff38B6FF);

  static get borderRadius => BorderRadius.circular(20);

  static const shadow = [
    BoxShadow(spreadRadius: 0.5, blurRadius: 3, color: Colors.black26)
  ];

  static get theme => ThemeData(
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
      ),
      useMaterial3: false);
}
