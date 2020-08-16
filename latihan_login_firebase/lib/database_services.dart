import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  static CollectionReference productCollection =
      Firestore.instance.collection('products');

  static Future<void> createorupdateProduct(String id,
      {String name, int prince}) async {
    await productCollection
        .document(id)
        .setData({'nama': name, 'harga': prince});
  }

  static Future<DocumentSnapshot> getProduct(String id) async {
    return await productCollection.document(id).get();
  }

  static Future<void> deleteProduct(String id) async {
    return await productCollection.document(id).delete();
  }
}
