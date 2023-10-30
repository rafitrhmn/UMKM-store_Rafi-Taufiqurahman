import 'package:flutter/material.dart';

class ActivityProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _dataactivity = [
    {
      'gambar_url':
          'https://upload.wikimedia.org/wikipedia/id/thumb/4/47/FC_Barcelona_%28crest%29.svg/1200px-FC_Barcelona_%28crest%29.svg.png',
      'nama_produk': 'Nasi Goreng',
      'harga': '10.000',
      'nama_pesanan': 'Aldi budi',
      'no_hp': '086664756475',
      'alamat': 'jl.amula rahayu',
      'metode_pembayaran': 'Dana',
    }
  ];

  List<Map<String, dynamic>> get dataactivity => _dataactivity;

  void addData(Map<String, dynamic> data) {
    _dataactivity.add(data);
    // print(_dataactivity);
    notifyListeners();
  }

  List<Map<String, dynamic>> use() {
    return _dataactivity;
  }
}
