import 'package:demo_application/consts/consts.dart';

class StoreServices {

  static getUser(String id) {
    return firebaseFirestore.collection(collectionUser).where('id', isEqualTo: id).get();
  }

}