import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:things/controllers/main_controller.dart';
import 'package:things/models/nav_bar_model.dart';
import 'package:things/services/gesture_services.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final mainController = MainController();
    return ValueListenableBuilder(
      valueListenable: mainController.pageIndex,
      builder: (context, pageIndex, child) {
        return SalomonBottomBar(
          currentIndex: pageIndex,
          onTap: (i) {
            GestureServices.onTapWithHaptic(() {
              mainController.setPageIndex(i);
            });
          },
          items:
              navBarItems
                  .map(
                    (value) => SalomonBottomBarItem(
                      icon: Icon(value.icon),
                      title: Text(value.title.tr()),
                    ),
                  )
                  .toList(),
        );
      },
    );
  }
}

List<NavBarModel> navBarItems = [
  NavBarModel(title: 'home', icon: Icons.home),
  NavBarModel(title: 'chats', icon: Icons.question_answer),
  NavBarModel(title: 'favorites', icon: Icons.favorite),
  NavBarModel(title: 'account', icon: Icons.person_pin),
];
