import 'package:flutter/material.dart';

class BoxTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 470, // Sesuaikan dengan kebutuhan Anda
      height: 250, // Sesuaikan dengan kebutuhan Anda
      margin: const EdgeInsets.all(23.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 255, 255,
              255), // Sesuaikan dengan warna garis yang diinginkan
          width: 4, // Sesuaikan dengan lebar garis yang diinginkan
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                color: const Color.fromARGB(77, 57, 55, 55),
              )
              // Image.asset(
              //   'assets/images/background-judul.jpg', // Ganti dengan path ke gambar latar belakang Anda
              //   fit: BoxFit.cover,
              //   width: 470, // Sesuaikan dengan lebar container
              //   height: 250, // Sesuaikan dengan tinggi container
              // ),
              ),
          Container(
            width: 470,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(
                  0.45), // Sesuaikan opasitas sesuai kebutuhan Anda
            ),
          ),
          const SizedBox(
            width: 470,
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 20,
                      top: 15), // Sesuaikan padding sesuai kebutuhan Anda
                  child: Text(
                    'UMKM Store',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors
                          .black, // Ganti dengan warna teks yang diinginkan
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(
                      left: 20), // Sesuaikan padding sesuai kebutuhan Anda
                  child: Text(
                    'ialah aplikasi yang membantu para pelaku UMKM Local untuk arah UMKM yang lebih maju ',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        wordSpacing: 2,
                        height: 1.25
                        // Ganti dengan warna teks yang diinginkan
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
