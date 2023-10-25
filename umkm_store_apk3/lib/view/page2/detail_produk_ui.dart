// ///halaman detail produk jika user menekan card produk
// ///
import 'package:flutter/material.dart';

// class DetailPage extends StatelessWidget {
//   final Map<String, dynamic> data;

//   const DetailPage({Key? key, required this.data}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Column(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height / 2,
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//               color: Colors.red,
//               borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(30),
//                 bottomRight: Radius.circular(30),
//               ),
//               image: DecorationImage(
//                 image: NetworkImage(data["gambar_url"]),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Stack(
//               children: [
//                 Positioned(
//                   top: 25,
//                   left: 17,
//                   child: InkWell(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(
//                         Icons.arrow_back_ios_new,
//                         size: 24,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ), //
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 10, top: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "${data['nama_produk']}",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 22,
//                     fontFamily: 'Montserrat',
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   '⭐${data['rating']}',
//                   style: TextStyle(
//                     fontFamily: 'Montserrat',
//                     fontSize: 20,
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       )),
//     );
//   }
// }

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> data;

  const DetailPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(data["gambar_url"]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 23,
                      left: 15,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 24,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${data['nama_produk']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          '⭐⭐⭐⭐⭐ ${data['rating']}',
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Harga: Rp${data['harga']}",
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "${data['deskripsi']}",
                      style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.w100),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey
                          .withOpacity(0.4), // Warna bayangan abu-abu
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // Perubahan posisi bayangan
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Beli Sekarang',
                    style: TextStyle(
                        fontSize: 19,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
