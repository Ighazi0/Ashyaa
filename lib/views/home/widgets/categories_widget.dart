import 'package:flutter/material.dart';
import 'package:things/app/app_style.dart';
import 'package:things/models/category_model.dart';
import 'package:things/services/firebase_services.dart';
import 'package:things/views/general/widgets/network_image_widget.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

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
          return SizedBox(
            height: 340,
            child: GridView.builder(
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
                return Container(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
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
                          fontSize: 18,
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
