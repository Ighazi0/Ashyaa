import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:things/controllers/main_controller.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mainController = MainController();
    return ValueListenableBuilder(
      valueListenable: mainController.pageIndex,
      builder: (context, pageIndex, child) {
        return SalomonBottomBar(
          currentIndex: pageIndex,
          onTap: (i) {
            mainController.setPageIndex(i);
          },
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("home".tr()),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text("Likes"),
            ),

            SalomonBottomBarItem(
              icon: Icon(Icons.search),
              title: Text("Search"),
            ),

            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
            ),
          ],
        );
      },
    );
  }
}
