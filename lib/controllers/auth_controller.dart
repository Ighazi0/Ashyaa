import 'package:get_storage/get_storage.dart';
import 'package:things/services/firebase_services.dart';

class AuthController {
  final getStorage = GetStorage();
  Future getUserData() async {
    final response = await FirebaseServices.getWithDoc(
      FirestoreCollections.users,
      getStorage.read('uid'),
    );
    if (response.exists) {
      return;
    } else {}
  }

  logOut() {
    getStorage.remove('uid');
  }
}
