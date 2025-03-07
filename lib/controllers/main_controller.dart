import 'package:flutter/widgets.dart';
import 'package:things/services/navigation_services.dart';
import 'package:things/views/main/screens/main_screen.dart';

class MainController {
  static final MainController _instance = MainController._internal();
  factory MainController() {
    return _instance;
  }
  final ValueNotifier<String> userData = ValueNotifier('');
  final ValueNotifier<int> pageIndex = ValueNotifier(0);

  MainController._internal() {
    onInit();
  }

  onInit() async {
    await Future.delayed(Duration(milliseconds: 500));
    NavigationServices.pushReplacement(MainScreen());
  }

  void setUserData(String data) {
    userData.value = data;
  }

  void setPageIndex(int index) {
    pageIndex.value = index;
  }
}
