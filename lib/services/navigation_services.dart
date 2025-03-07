import 'package:flutter/material.dart';
import 'package:things/app/init_app.dart';

class NavigationServices {
  static push(Widget child) {
    navigatorKey.currentState!.push(
      MaterialPageRoute(builder: (context) => child),
    );
  }

  static pushReplacement(Widget child) {
    navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute(builder: (context) => child),
    );
  }

  static pop() {
    navigatorKey.currentState!.pop();
  }
}
