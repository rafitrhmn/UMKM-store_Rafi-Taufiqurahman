import 'package:cloud_firestore/cloud_firestore.dart';

class ApiService {
  static Future<List<DocumentSnapshot>> fetchData() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('produk').get();
      return querySnapshot.docs;
    } catch (e) {
      print('Error occurred: $e');
      return [];
    }
  }
}
