// import 'dart:js';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:umkm_store_apk3/view/search_tampil.dart';

// class SearchWidget extends StatelessWidget {
//   final TextEditingController controller = TextEditingController();

// // Mencari data berdasarkan nama toko
//   void searchStore(String storeName) async {
//     var query = FirebaseFirestore.instance
//         .collection('produk')
//         .where('nama_produk', isEqualTo: storeName);

//     var querySnapshot = await query.get();
//     print(querySnapshot);
//     if (querySnapshot.size > 0) {
//       // Data ditemukan, lakukan sesuatu...
//       //arahkan halaman baru dari hasil pencarian
//       //tangkap dan tampilkan
//       //dibaris kode ini.
//       // Navigate to the search results page
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => SearchResultPage(searchResults: querySnapshot),
//         ),
//       );
//       for (var doc in querySnapshot.docs) {
//         print('Store Name: ${doc['nama_produk']}, Harga: ${doc['harga']}');
//       }
//     } else {
//       // Data tidak ditemukan
//       print('No store found with the name: $storeName');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: controller,
//               decoration: InputDecoration(
//                 hintText: "Search...",
//               ),
//             ),
//           ),
//           SizedBox(width: 16.0),
//           ElevatedButton(
//             onPressed: () {
//               // Implement your search logic here
//               String searchText = controller.text;
//               // Perform a search operation with searchText
//               print('Searching for: $searchText');
//               searchStore(context, searchText);
//             },
//             child: Text("Search"),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:umkm_store_apk3/view/page2/search_tampil_ui.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  // Mencari data berdasarkan nama toko
  void searchStore(BuildContext context, String storeName) async {
    var query = FirebaseFirestore.instance
        .collection('produk')
        .where('nama_produk', isEqualTo: storeName);

    var querySnapshot = await query.get();
    print(querySnapshot);
    if (querySnapshot.size > 0) {
      // Data ditemukan, lakukan sesuatu...
      //arahkan halaman baru dari hasil pencarian
      //tangkap dan tampilkan
      //dibaris kode ini.
      // Navigate to the search results page
      //store name ditampilkan di file serrch_tampil pada baris 98-100
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchResultPage(searchResults: querySnapshot),
        ),
      );
      for (var doc in querySnapshot.docs) {
        print('Store Name: ${doc['nama_produk']}, Harga: ${doc['harga']}');
      }
    } else {
      // Data tidak ditemukan
      print('No store found with the name: $storeName');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Search...",
              ),
            ),
          ),
          SizedBox(width: 16.0),
          ElevatedButton(
            onPressed: () {
              // Implement your search logic here
              String searchText = controller.text;
              // Perform a search operation with searchText
              print('Searching for: $searchText');
              searchStore(context, searchText); // Send the context here
            },
            child: Text("Search"),
          ),
        ],
      ),
    );
  }
}
