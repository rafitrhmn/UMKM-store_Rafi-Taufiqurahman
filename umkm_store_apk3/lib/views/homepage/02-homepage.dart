import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:umkm_store_apk3/view_models/cardProduk_viewModel.dart';
import 'package:umkm_store_apk3/views/homepage/search_ui.dart';
import '../widgets/battom_navbar_ui.dart';
import 'card_list_ui.dart';
import 'slider_ui.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late bool _isLoading = true;
  final int nopage = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    CardProvider cardProvider =
        Provider.of<CardProvider>(context, listen: false);
    await cardProvider.fetchDataProduk();
    setState(() {
      _isLoading = false;
    });
  }

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
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: CardList(),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.chat_bubble_rounded,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(selectedIndex: nopage),
    );
  }
}
