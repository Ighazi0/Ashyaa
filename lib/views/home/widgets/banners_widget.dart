import 'dart:async';

import 'package:flutter/material.dart';
import 'package:things/app/app_style.dart';
import 'package:things/models/banner_model.dart';
import 'package:things/services/firebase_services.dart';
import 'package:things/views/general/widgets/network_image_widget.dart';
import 'package:things/views/general/widgets/shimmer_widget.dart';

class BannersWidget extends StatefulWidget {
  const BannersWidget({super.key});

  @override
  State<BannersWidget> createState() => _BannersWidgetState();
}

class _BannersWidgetState extends State<BannersWidget> {
  late PageController _pageController;
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseServices.getData(FirestoreCollections.banners),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          final banners =
              snapshot.data?.docs
                  .map((b) => BannerModel.fromJson(b.data(), b.reference))
                  .toList();
          return Column(
            children: [
              SizedBox(
                height: 150,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index % (banners?.length ?? 0);
                    });
                  },
                  itemBuilder: (context, index) {
                    final banner = banners?[index % banners.length];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: ClipRRect(
                        borderRadius: AppStyle.borderRadius,
                        child: NetworkImageWidget(
                          url: banner?.image ?? '',
                          boxFit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(banners?.length ?? 0, (index) {
                  final active =
                      _currentIndex == (index % (banners?.length ?? 0));
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: active ? 10 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: active ? AppStyle.secondryColor : Colors.grey,
                    ),
                  );
                }),
              ),
            ],
          );
        }
        return ShimmerWidget(
          enable: true,
          child: Container(
            height: 150,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: AppStyle.borderRadius,
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }
}
