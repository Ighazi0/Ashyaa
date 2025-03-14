import 'package:flutter/material.dart';
import 'package:things/services/navigation_services.dart';
import 'package:things/views/ads/screens/new_ad_screen.dart';

class NewAdsButton extends StatelessWidget {
  const NewAdsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        NavigationServices.push(NewAdScreen());
      },
      mini: true,
      child: Icon(Icons.add),
    );
  }
}
