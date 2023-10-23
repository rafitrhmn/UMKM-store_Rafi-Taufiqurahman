// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(MaterialApp(
// //     home: ImageFromFirebase(),
// //   ));
// // }

// // class ImageFromFirebase extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Image from Firebase Storage'),
// //       ),
// //       body: Center(
// //         child: Image.network(
// //           'https://firebasestorage.googleapis.com/v0/b/umkm-store-9f3cb.appspot.com/o/bakso-jati.jpg',
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(MaterialApp(
// //     home: Scaffold(
// //       appBar: AppBar(
// //         title: Text('Display Image from Firebase'),
// //       ),
// //       body: Center(
// //         child: Image.network(
// //           'https://firebasestorage.googleapis.com/v0/b/umkm-store-9f3cb.appspot.com/o/bakso-jati.jpg?alt=media&token=9b3439fd-6b3f-4d8d-a99a-5ccba1b7b2bd&_gl=1*qiuefu*_ga*MTU0NTE4NDU1NS4xNjk2NDA0NDE1*_ga_CW55HF8NVT*MTY5NzcxMTk1Ny4zLjEuMTY5NzcxMjIxNS42MC4wLjA',
// //         ),
// //       ),
// //     ),
// //   ));
// // }

// // import 'package:flutter/material.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:firebase_storage/firebase_storage.dart';

// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   var firebaseApp = await Firebase.initializeApp();
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: MyHomePage(),
// //     );
// //   }
// // }

// // class MyHomePage extends StatefulWidget {
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   String imageUrl = '';

// //   Future<String> getImageUrl(String imagePath) async {
// //     String downloadURL =
// //         await FirebaseStorage.instance.ref(imagePath).getDownloadURL();
// //     return downloadURL;
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     getImage();
// //   }

// //   Future<void> getImage() async {
// //     String path =
// //         'bakso-jati.jpg'; // Ganti dengan path gambar Anda di Firebase Storage
// //     String url = await getImageUrl(path);
// //     setState(() {
// //       imageUrl = url;
// //     });
// //     print('Image URL: $imageUrl');
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Firebase Storage URL'),
// //       ),
// //       body: Center(
// //         child: imageUrl.isNotEmpty
// //             ? Image.network(imageUrl)
// //             : CircularProgressIndicator(),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// // import 'firebase_options.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   FirebaseOptions android = const FirebaseOptions(
//       apiKey: 'AIzaSyA2jGmyVMQJmXVDOTUN-WxGwGLveblbigM',
//       appId: '1:1098081256141:android:304336ffeaf35973741f84',
//       messagingSenderId: '1098081256141',
//       projectId: 'umkm-store-9f3cb',
//       storageBucket: 'umkm-store-9f3cb.appspot.com');
//   await Firebase.initializeApp(options: android);
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ImageFromFirebase(),
//     );
//   }
// }

// class ImageFromFirebase extends StatefulWidget {
//   @override
//   _ImageFromFirebaseState createState() => _ImageFromFirebaseState();
// }

// class _ImageFromFirebaseState extends State<ImageFromFirebase> {
//   String imageUrl = '';

//   void getImageUrl() async {
//     String path =
//         'bakso-jati.jpg'; // Ganti dengan nama berkas Anda di Firebase Storage
//     try {
//       final ref = FirebaseStorage.instance.ref(path);
//       imageUrl = await ref.getDownloadURL();
//     } catch (e) {
//       print(e.toString());
//     }
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     getImageUrl();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Firebase Storage Example'),
//       ),
//       body: Center(
//         child: imageUrl.isNotEmpty
//             ? Image.network(imageUrl)
//             : CircularProgressIndicator(),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:umkm_store_apk/firebase_options.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(MaterialApp(
//     home: ImageFromFirebase(),
//   ));
// }

// class ImageFromFirebase extends StatefulWidget {
//   @override
//   _ImageFromFirebaseState createState() => _ImageFromFirebaseState();
// }

// class _ImageFromFirebaseState extends State<ImageFromFirebase> {
//   String imageUrl = '';

//   void getImageUrl() async {
//     String path =
//         'https://firebasestorage.googleapis.com/v0/b/umkm-store-9f3cb.appspot.com/o/bakso-jati.webp?alt=media&token=50653116-17ca-4907-8e07-e65cd9a500f9&_gl=1*162jv3w*_ga*MTU0NTE4NDU1NS4xNjk2NDA0NDE1*_ga_CW55HF8NVT*MTY5Nzc4MzYyNC42LjEuMTY5Nzc4OTEzMC41Ny4wLjA.'; // Ganti dengan path gambar Anda di Firebase Storage
//     try {
//       final ref = FirebaseStorage.instance.ref(path);
//       imageUrl = await ref.getDownloadURL();
//     } catch (e) {
//       print(e.toString());
//     }
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     getImageUrl();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Firebase Storage Example'),
//       ),
//       body: Center(
//         child: imageUrl.isNotEmpty
//             ? Image.network(imageUrl)
//             : CircularProgressIndicator(),
//       ),
//     );
//   }
// }
