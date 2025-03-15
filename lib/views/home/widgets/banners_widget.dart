import 'dart:async';

import 'package:flutter/material.dart';
import 'package:things/app/app_style.dart';
import 'package:things/models/banner_model.dart';
import 'package:things/services/device_services.dart';
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
    _pageController = PageController(viewportFraction: 0.925);
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

  static Size get bannerSize {
    double screenWidth = DeviceServices.width;
    double height = screenWidth / 2.5;
    return Size(screenWidth, height);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseServices.getDataWithOrderBy(
        FirestoreCollections.banners,
        FirestoreFields.position,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final banners =
              snapshot.data!.docs
                  .map((c) => BannerModel.fromJson(c.data(), c.reference))
                  .toList();
          return Column(
            children: [
              SizedBox(
                width: bannerSize.width,
                height: bannerSize.height,
                child: PageView.builder(
                  controller: _pageController,

                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index % banners.length;
                    });
                  },
                  itemBuilder: (context, index) {
                    final banner = banners[index % banners.length];
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
                      child: ClipRRect(
                        borderRadius: AppStyle.borderRadius,
                        child: NetworkImageWidget(
                          url: banner.image ?? '',
                          boxFit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(banners.length, (index) {
                  final active = _currentIndex == (index % banners.length);
                  return GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(
                        index % banners.length,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      width: active ? 10 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: active ? AppStyle.secondryColor : Colors.grey,
                      ),
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
            width: bannerSize.width,
            height: bannerSize.height,
            margin: const EdgeInsets.fromLTRB(5, 10, 5, 5),
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
