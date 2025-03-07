import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:things/app/app_style.dart';
import 'package:things/views/splash/screens/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class InitApp extends StatelessWidget {
  const InitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: AppStyle.theme,
      darkTheme: AppStyle.darkTheme,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      home: const SplashScreen(),
    );
  }
}
