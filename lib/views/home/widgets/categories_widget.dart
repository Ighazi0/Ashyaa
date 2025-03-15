import 'package:flutter/material.dart';
import 'package:things/app/app_style.dart';
import 'package:things/models/category_model.dart';
import 'package:things/services/firebase_services.dart';
import 'package:things/services/navigation_services.dart';
import 'package:things/views/category/screens/category_screen.dart';
import 'package:things/views/general/widgets/network_image_widget.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  late ScrollController _scrollController;
  bool _scrollForward = true;
  bool started = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  void _startAutoScroll() async {
    started = true;
    while (true) {
      if (_scrollController.hasClients) {
        double maxScroll = _scrollController.position.maxScrollExtent;
        double minScroll = _scrollController.position.minScrollExtent;

        if (_scrollForward) {
          await _scrollController.animateTo(
            maxScroll,
            duration: Duration(seconds: 20),
            curve: Curves.easeInOut,
          );
        } else {
          await _scrollController.animateTo(
            minScroll,
            duration: Duration(seconds: 20),
            curve: Curves.easeInOut,
          );
        }

        _scrollForward = !_scrollForward;
        await Future.delayed(Duration(seconds: 1));
      } else {
        await Future.delayed(Duration(milliseconds: 500));
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseServices.getDataWithOrderBy(
        FirestoreCollections.categories,
        FirestoreFields.position,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final categories =
              snapshot.data!.docs
                  .map((c) => CategoryModel.fromJson(c.data(), c.reference))
                  .toList();
          if (categories.length > 6) {
            if (!started) {
              _startAutoScroll();
            }
          }
          return Container(
            margin: EdgeInsets.only(top: 5),
            height: 325,
            child: GridView.builder(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.25,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () {
                    NavigationServices.push(CategoryScreen());
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                    decoration: BoxDecoration(
                      boxShadow: AppStyle.shadow,
                      color: Colors.white,
                      borderRadius: AppStyle.borderRadius,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          category.titleAr ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: NetworkImageWidget(
                              url: category.image ?? '',
                              boxFit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
