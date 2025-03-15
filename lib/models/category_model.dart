import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String? title;
  String? titleAr;
  String? image;
  int? position;
  DocumentReference? docRef;

  CategoryModel({
    this.title,
    this.titleAr,
    this.image,
    this.position,
    this.docRef,
  });

  factory CategoryModel.fromJson(Map json, DocumentReference docRef) {
    return CategoryModel(
      title: json['title'],
      titleAr: json['titleAr'],
      image: json['image'],
      position: json['position'],
      docRef: docRef,
    );
  }
}
