import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:umkm_store_apk3/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Storage Image',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FirebaseStorageImage(),
    );
  }
}

class FirebaseStorageImage extends StatefulWidget {
  @override
  _FirebaseStorageImageState createState() => _FirebaseStorageImageState();
}

class _FirebaseStorageImageState extends State<FirebaseStorageImage> {
  String imageUrl = '';

  void downloadImage() async {
    // String firebaseStorageURL = 'your_firebase_storage_url_here';
    var ref = FirebaseStorage.instance.ref().child('bakso.jpg');
    var url = await ref.getDownloadURL();
    setState(() {
      imageUrl = url;
    });
  }

  @override
  void initState() {
    super.initState();
    downloadImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Storage Image'),
      ),
      body: Center(
        child: imageUrl != ''
            ? Image.network(imageUrl)
            : CircularProgressIndicator(),
      ),
    );
  }
}
