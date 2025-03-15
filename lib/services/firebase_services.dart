import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  static Future<DocumentSnapshot<Map<String, dynamic>>> getDataWithDoc(
    FirestoreCollections collectionName,
    String docId,
  ) async {
    try {
      final response =
          await FirebaseFirestore.instance
              .collection(collectionName.toString())
              .doc(docId)
              .get();
      return response;
    } catch (e) {
      throw 'getDataWithDoc ❌ collectionName:$collectionName 🥨 docId:$docId e:$e';
    }
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getData(
    FirestoreCollections collectionName,
  ) async {
    try {
      final response =
          await FirebaseFirestore.instance
              .collection(collectionName.toString())
              .get();
      return response;
    } catch (e) {
      throw 'getData ❌ collectionName:$collectionName e:$e';
    }
  }

  static Future<QuerySnapshot<Map<String, dynamic>>> getDataWithOrderBy(
    FirestoreCollections collectionName,
    FirestoreFields orderFiled,
  ) async {
    try {
      final response =
          await FirebaseFirestore.instance
              .collection(collectionName.toString())
              .orderBy(orderFiled.toString())
              .get();
      return response;
    } catch (e) {
      throw 'getDataWithOrderBy ❌ collectionName:$collectionName 🥨 orderFiled:$orderFiled  e:$e';
    }
  }
}

enum FirestoreCollections {
  users._("users"),
  products._("products"),
  orders._("orders"),
  categories._("categories"),
  banners._("banners");

  final String value;
  const FirestoreCollections._(this.value);

  @override
  String toString() => value;
}

enum FirestoreFields {
  position._("position");

  final String value;
  const FirestoreFields._(this.value);

  @override
  String toString() => value;
}
