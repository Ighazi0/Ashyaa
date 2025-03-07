import 'package:flutter/material.dart';
import 'package:things/controllers/main_controller.dart';
import 'package:things/views/main/home/screens/home_screen.dart';
import 'package:things/views/main/widgets/bottom_nav_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavWidget(),
      body: ValueListenableBuilder(
        valueListenable: MainController().pageIndex,
        builder: (context, pageIndex, child) {
          return IndexedStack(
            index: pageIndex,
            children: [HomeScreen(), HomeScreen(), HomeScreen(), HomeScreen()],
          );
        },
      ),
    );
  }
}
