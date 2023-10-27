import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/api_firebase/api_service_produk_umkm.dart';

class CardProvider extends ChangeNotifier {
  List<DocumentSnapshot> _dataProduk = [];

  List<DocumentSnapshot> get dataProduk => _dataProduk;

  Future<void> fetchDataProduk() async {
    try {
      List<DocumentSnapshot> data = await ApiService.fetchData();
      _dataProduk = data;
      print('berhasil');
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void start() async {
    await fetchDataProduk();
  }

  List<DocumentSnapshot> yh() {
    return _dataProduk;
  }
}
