import 'package:flutter/material.dart';
import 'package:things/app/app_style.dart';
import 'package:things/services/navigation_services.dart';
import 'package:things/views/general/widgets/logo_image.dart';
import 'package:things/views/notifications/screens/notifications_screen.dart';
import 'package:things/views/search/screens/search_screen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 50,
      centerTitle: false,
      backgroundColor: AppStyle.secondryColor,
      floating: true,
      snap: true,
      title: LogoImage(width: 50),
      actions: [
        IconButton(
          onPressed: () {
            NavigationServices.push(SearchScreen());
          },
          icon: Icon(Icons.search, size: 30),
        ),
        IconButton(
          onPressed: () {
            NavigationServices.push(NotificationsScreen());
          },
          icon: Icon(Icons.notifications, size: 30),
        ),
      ],
    );
  }
}
