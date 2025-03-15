import 'package:flutter/material.dart';

class DeviceServices {
  static double get width => MediaQueryData.fromView(
          WidgetsBinding.instance.platformDispatcher.views.first)
      .size
      .width;

  static double get height => MediaQueryData.fromView(
          WidgetsBinding.instance.platformDispatcher.views.first)
      .size
      .height;
}
