// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/foundation.dart';

// class ApiService extends ChangeNotifier {
//   List<String> imageUrls = [];

//   Future<void> getImagesFromFirebaseStorage() async {
//     try {
//       Reference ref = FirebaseStorage.instance.ref().child('slider');
//       ListResult result = await ref.listAll();
//       List<Reference> allFiles = result.items;
//       List<String> urls = [];
//       for (var imageRef in allFiles) {
//         String url = await imageRef.getDownloadURL();
//         urls.add(url);
//       }
//       imageUrls = urls;
//       notifyListeners();
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }

// import 'package:flutter/foundation.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:umkm_store_apk3/model/provider/provider_slider.dart';
// // import 'image_provider.dart'; // Ganti dengan lokasi file ImageProvider yang sesuai

// class ApiService extends ChangeNotifier {
//   final ImageProvider _imageProvider;

//   ApiService(this._imageProvider);

//   Future<void> getImagesFromFirebaseStorage() async {
//     try {
//       Reference ref = FirebaseStorage.instance.ref().child('slider');
//       ListResult result = await ref.listAll();
//       List<Reference> allFiles = result.items;
//       List<String> urls = [];
//       for (var imageRef in allFiles) {
//         String url = await imageRef.getDownloadURL();
//         urls.add(url);
//       }
//       _imageProvider.setImageUrls(urls);
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }

// import 'package:flutter/foundation.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:umkm_store_apk3/model/provider/provider_slider.dart';

// class ApiService {
//   final ImageProvider _imageProvider;

//   ApiService(this._imageProvider);

//   Future<void> getImagesFromFirebaseStorage() async {
//     try {
//       Reference ref = FirebaseStorage.instance.ref().child('slider');
//       ListResult result = await ref.listAll();
//       List<Reference> allFiles = result.items;
//       List<String> urls = [];
//       for (var imageRef in allFiles) {
//         String url = await imageRef.getDownloadURL();
//         urls.add(url);
//       }
//       _imageProvider.setImageUrls(urls);
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }

// import 'package:firebase_storage/firebase_storage.dart';

// class FirebaseStorageService {
//   static FirebaseStorage storage = FirebaseStorage.instance;

//   static Future<List<String>> getImagesFromFolder(String folderPath) async {
//     List<String> imageUrls = [];
//     try {
//       ListResult listResult = await storage.ref(folderPath).listAll();
//       for (Reference ref in listResult.items) {
//         String downloadURL = await ref.getDownloadURL();
//         imageUrls.add(downloadURL);
//       }
//     } catch (e) {
//       print('Error occurred: $e');
//     }
//     return imageUrls;
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirestoreService {
//   static Future<<String>> getAllImageUrls() async {
//     QuerySnapshot<Map<String, dynamic>> querySnapshot =
//         await FirebaseFirestore.instance.collection('sliderImage').get();

//     List<String> imageUrls = [];

//     if (querySnapshot.docs.isNotEmpty) {
//       querySnapshot.docs.forEach((doc) {
//         if (doc.data().containsKey('gambar')) {
//           imageUrls.add(doc['gambar']);
//         }
//       });
//     }

//     return imageUrls;
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirestoreService {
//   static Future<String> getImageUrl() async {
//     QuerySnapshot<Map<String, dynamic>> querySnapshot =
//         await FirebaseFirestore.instance.collection('slider').get();

//     if (querySnapshot.docs.isNotEmpty) {
//       return querySnapshot.docs[0].get('gambar');
//     } else {
//       throw Exception('No documents found');
//     }
//   }
// }

//api memget firestore imageslider
// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirestoreService {
//   static Future<List<String>> getImageUrl() async {
//     QuerySnapshot<Map<String, dynamic>> querySnapshot =
//         await FirebaseFirestore.instance.collection('sliderImage').get();

//     List<String> imageUrls = [];

//     if (querySnapshot.docs.isNotEmpty) {
//       querySnapshot.docs.forEach((doc) {
//         if (doc.data().containsKey('gambar')) {
//           imageUrls.add(doc['gambar']);
//         }
//       });
//     }

//     return imageUrls;
//   }
// }
