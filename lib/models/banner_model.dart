import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String? title;
  String? image;
  int? position;

  BannerModel({this.title, this.image, this.position});

  factory BannerModel.fromJson(Map json, DocumentReference docRef) {
    return BannerModel(
      title: json['title'],
      image: json['image'],
      position: json['position'],
    );
  }
}
