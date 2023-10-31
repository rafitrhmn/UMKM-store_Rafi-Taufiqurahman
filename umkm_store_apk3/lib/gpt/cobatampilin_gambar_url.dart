import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:umkm_store_apk3/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore Image Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore Image Demo'),
      ),
      body: StreamBuilder(
        stream: firestore.collection('produk').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot products = snapshot.data!.docs[index];
              String imageUrl = products['gambar_url'];
              return ListTile(
                title: Text(products['nama_produk']),
                subtitle: Text(products['harga']),
                // ignore: unnecessary_null_comparison
                leading: imageUrl != null
                    ? Image.network(imageUrl)
                    : Image.asset('assets/images/icon-belanja.png'),
              );
            },
          );
        },
      ),
    );
  }
}
