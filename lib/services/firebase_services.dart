import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  static Future<DocumentSnapshot<Map<String, dynamic>>> getWithDoc(
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
      throw 'getWithDoc ❌ collectionName:$collectionName 🥨 docId:$docId e:$e';
    }
  }
}

enum FirestoreCollections {
  users._("users"),
  products._("products"),
  orders._("orders");

  final String value;
  const FirestoreCollections._(this.value);

  @override
  String toString() => value;
}
