import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? fullName;
  String? gender;
  String? uid;
  String? image;
  String? phone;
  Timestamp? birthday, createdAt, updatedAt, plus, removeAds;
  bool? deleted, blocked;
  DocumentReference? docRef;

  UserModel({
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.fullName,
    this.gender,
    this.image,
    this.uid,
    this.birthday,
    this.createdAt,
    this.deleted = false,
    this.blocked = false,
    this.docRef,
    this.phone,
  });

  factory UserModel.fromJson(Map json, DocumentReference docRef) {
    return UserModel(
      email: json['email'],
      password: json['password'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      fullName: json['full_name'],
      gender: json['gender'],
      uid: json['uid'],
      image: json['image'],
      birthday: json['birthday'],
      createdAt: json['created_at'],
      deleted: json['deleted'],
      blocked: json['blocked'],
      phone: json['phone'],
      docRef: docRef,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'full_name': fullName,
      'gender': gender,
      'uid': uid,
      'image': image,
      'birthday': birthday,
      'created_at': createdAt,
      'deleted': deleted,
      'blocked': blocked,
      'phone': phone,
    };
  }
}
