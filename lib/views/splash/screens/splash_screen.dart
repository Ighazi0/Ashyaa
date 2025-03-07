import 'package:flutter/material.dart';
import 'package:things/app/app_assets.dart';
import 'package:things/app/app_style.dart';
import 'package:things/controllers/main_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainController();
    return Scaffold(
      backgroundColor: AppStyle.secondryColor,
      body: Center(child: Image.asset(AppAssets.appLogo, width: 200)),
    );
  }
}
