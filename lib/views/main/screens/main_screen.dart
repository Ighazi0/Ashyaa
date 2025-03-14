import 'package:flutter/material.dart';
import 'package:things/controllers/main_controller.dart';
import 'package:things/views/account/screens/account_screen.dart';
import 'package:things/views/chats/screens/chats_screen.dart';
import 'package:things/views/favorites/screens/favorites_screen.dart';
import 'package:things/views/home/screens/home_screen.dart';
import 'package:things/views/main/widgets/bottom_nav_bar.dart';
import 'package:things/views/main/widgets/new_ads_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: NewAdsButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      bottomNavigationBar: BottomNavBar(),
      body: ValueListenableBuilder(
        valueListenable: MainController().pageIndex,
        builder: (context, pageIndex, child) {
          return IndexedStack(
            index: pageIndex,
            children: [
              HomeScreen(),
              ChatsScreen(),
              FavoritesScreen(),
              AccountScreen(),
            ],
          );
        },
      ),
    );
  }
}
