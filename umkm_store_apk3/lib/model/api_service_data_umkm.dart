// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class ApiService {
//   static Future<List<Map<String, dynamic>>> fetchData() async {
//     final response = await http
//         .get(Uri.parse('https://651fca6a906e276284c382ae.mockapi.io/data'));
//     if (response.statusCode == 200) {
//       return List<Map<String, dynamic>>.from(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load data from API');
//     }
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';

// class ApiService {
//   static Future<List<Map<String, dynamic>>> fetchData() async {
//     List<Map<String, dynamic>> data = [];
//     try {
//       QuerySnapshot querySnapshot =
//           await FirebaseFirestore.instance.collection('produk').get();
//       querySnapshot.docs.forEach((doc) {
//         Map<String, dynamic> item = doc.data() as Map<String, dynamic>;
//         data.add(item);
//       });
//     } catch (e) {
//       print('Error occurred: $e');
//     }
//     return data;
//   }
// }

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
