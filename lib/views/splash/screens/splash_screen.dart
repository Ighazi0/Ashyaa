import 'package:flutter/material.dart';
import 'package:things/controllers/main_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainController();
    return Scaffold(body: Center(child: Text('splash')));
  }
}
