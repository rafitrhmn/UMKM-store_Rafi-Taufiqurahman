// import 'dart:typed_data';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';

// class ImageFromFirebase extends StatefulWidget {
//   @override
//   _ImageFromFirebaseState createState() => _ImageFromFirebaseState();
// }

// class _ImageFromFirebaseState extends State<ImageFromFirebase> {
//   Uint8List? imageFile;

//   // Function to get image from Firebase Storage
//   Future<void> getImage() async {
//     Reference ref = FirebaseStorage.instance.ref(
//         'https://firebasestorage.googleapis.com/v0/b/umkm-store-9f3cb.appspot.com/o/bakso-jati.jpg?alt=media&token=9b3439fd-6b3f-4d8d-a99a-5ccba1b7b2bd&_gl=1*qiuefu*_ga*MTU0NTE4NDU1NS4xNjk2NDA0NDE1*_ga_CW55HF8NVT*MTY5NzcxMTk1Ny4zLjEuMTY5NzcxMjIxNS42MC4wLjA.');
//     final data = await ref.getData();
//     setState(() {
//       imageFile = data;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     // Call the function to get image when the widget initializes
//     getImage();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image from Firebase'),
//       ),
//       body: Center(
//         child: imageFile != null
//             ? Image.memory(
//                 imageFile!,
//                 fit: BoxFit.cover, // You can adjust the fit as needed
//               )
//             : CircularProgressIndicator(), // Show a loading indicator while image is being fetched
//       ),
//     );
//   }
// }

// void main() => runApp(MaterialApp(home: ImageFromFirebase()));
