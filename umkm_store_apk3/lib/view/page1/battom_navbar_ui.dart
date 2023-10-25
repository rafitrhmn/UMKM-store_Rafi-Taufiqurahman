import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white, // Mengatur warna latar belakang
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black38, // Mengatur warna item yang dipilih
      type: BottomNavigationBarType.fixed, // Mengatur tipe menjadi fixed
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_long_rounded),
          label: 'Activity',
        ),
      ],
    );
  }
}
