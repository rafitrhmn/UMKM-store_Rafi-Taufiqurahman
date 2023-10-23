import 'package:flutter/material.dart';
import 'package:umkm_store_apk3/view/box-title.dart';
import 'package:umkm_store_apk3/view/search_ui.dart';

import 'card-list-view.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/icon-belanja.png', // Ganti dengan path ke gambar logo Anda
                fit: BoxFit.contain,
                height: 32, // Sesuaikan ukuran yang diinginkan
              ),
              const SizedBox(
                width: 8,
              ),
              const Text(
                'UMKM Store',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Search(),
              BoxTitle(),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.only(
                    left: 27), // Sesuaikan padding sesuai kebutuhan Anda
                child: Text(
                  'Daftar UMKM ',
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.black,
                    wordSpacing: 2,
                    height: 1.25,
                    fontWeight: FontWeight.bold,
                    // Ganti dengan warna teks yang diinginkan
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(24.0),
                child: GridB(),
              ),
            ],
          ),
        ));
  }
}

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('UMKM Store', style: TextStyle(color: Colors.black)),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       body: const Center(
//         child: Text('Ini adalah halaman utama'),
//       ),
//     );
//   }
// }

// appBar: AppBar(
//         title: Row(
//           children: [
//             Image.asset(
//               'assets/image/es-kenapa-muda.png', // Ganti dengan path ke gambar Anda
//               height: 40, // Atur tinggi gambar sesuai kebutuhan
//               width: 40, // Atur lebar gambar sesuai kebutuhan
//             ),
//             const SizedBox(width: 8), // Jarak antara gambar dan teks
//             const Text(
//               'ES kenapa muda',
//               style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
//             ),
//           ],
//         ),
//       ),
