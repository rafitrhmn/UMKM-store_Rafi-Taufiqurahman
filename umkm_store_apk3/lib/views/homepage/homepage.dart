import 'package:flutter/material.dart';
// import 'package:umkm_store_apk3/views/homepage/battom_navbar_ui.dart';
import 'package:umkm_store_apk3/views/homepage/search_ui.dart';
import '../widgets/battom_navbar_ui.dart';
import 'card_list_ui.dart';
import 'slider_ui.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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
              style: TextStyle(color: Colors.black, fontFamily: 'Montserrat'),
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
            const SizedBox(height: 20),
            SearchWidget(),
            CustomSizedBoxSlider(),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(
                  left: 27), // Sesuaikan padding sesuai kebutuhan Anda
              child: Text(
                'Produk dan Jasa ',
                style: TextStyle(
                  fontFamily: 'Montserrat',
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
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
