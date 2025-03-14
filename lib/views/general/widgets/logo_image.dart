import 'package:flutter/material.dart';
import 'package:things/app/app_assets.dart';

class LogoImage extends StatelessWidget {
  final double? height;
  final double? width;

  const LogoImage({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppAssets.appLogo, height: height, width: width);
  }
}
