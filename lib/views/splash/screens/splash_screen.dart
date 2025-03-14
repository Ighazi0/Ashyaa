import 'package:flutter/material.dart';
import 'package:things/app/app_style.dart';
import 'package:things/controllers/main_controller.dart';
import 'package:things/views/general/widgets/logo_image.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainController();
    return Scaffold(
      backgroundColor: AppStyle.secondryColor,
      body: Center(child: LogoImage(width: 200)),
    );
  }
}
