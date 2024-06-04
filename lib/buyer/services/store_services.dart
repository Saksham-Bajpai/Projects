import'package:charity_reads_1/buyer/consts/consts.dart';

class StoreServices {
  static getProfile(uid) {
    return firestore.collection(userCollection).where('id', isEqualTo: uid).get();
  }

  static getMessages(uid) {
    return firestore.collection(chatCollection).where('toId', isEqualTo: uid).snapshots();
  }
  
  static getOrders(uid) {
    return firestore.collection(ordersCollection).where("vendors", arrayContains: uid).snapshots();
  }

  static getProducts(uid) {
    return firestore.collection(productsCollection).where('vendor_id', isEqualTo: uid).snapshots();
  }
}