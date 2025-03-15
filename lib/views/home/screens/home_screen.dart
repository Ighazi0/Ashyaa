import 'package:flutter/material.dart';
import 'package:things/views/home/widgets/banners_widget.dart';
import 'package:things/views/home/widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [HomeAppBar(), SliverToBoxAdapter(child: BannersWidget())],
      ),
    );
  }
}
