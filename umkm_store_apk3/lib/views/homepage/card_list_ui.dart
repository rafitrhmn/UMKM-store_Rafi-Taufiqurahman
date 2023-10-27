// ///tampilan card list view
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../../models/api_firebase/api_service_produk_umkm.dart';
// import '../detailpage/detail_produk_ui.dart';

// class GridB extends StatefulWidget {
//   const GridB({Key? key}) : super(key: key);

//   @override
//   State<GridB> createState() => _GridBState();
// }

// class _GridBState extends State<GridB> {
//   late List<DocumentSnapshot> gridMap = [];

//   Future<void> fetchData() async {
//     List<DocumentSnapshot> data = await ApiService.fetchData();
//     setState(() {
//       gridMap = data;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 12.0,
//         mainAxisSpacing: 12.0,
//         mainAxisExtent: 300,
//       ),
//       itemCount: gridMap.length,
//       itemBuilder: (_, index) {
//         var data = gridMap[index].data() as Map<String, dynamic>;
//         return GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => DetailPage(data: data)),
//             );
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16.0),
//               color: Colors.grey.shade100,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.4), // Warna bayangan abu-abu
//                   spreadRadius: 5,
//                   blurRadius: 7,
//                   offset: Offset(0, 3), // Perubahan posisi bayangan
//                 ),
//               ],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(16.0),
//                     topRight: Radius.circular(16.0),
//                   ),
//                   child: Image.network(
//                     "${data['gambar_url']}",
//                     height: 170,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(
//                         height: 5.0,
//                       ),
//                       Text(
//                         "${data['nama_produk']}",
//                         style: Theme.of(context).textTheme.subtitle1!.merge(
//                               const TextStyle(
//                                 fontFamily: 'Montserrat',
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 18,
//                               ),
//                             ),
//                       ),
//                       const SizedBox(
//                         height: 8.0,
//                       ),
//                       Text(
//                         "Rp${data['harga']}",
//                         style: Theme.of(context).textTheme.subtitle2!.merge(
//                               TextStyle(
//                                   fontWeight: FontWeight.w700,
//                                   color: const Color.fromARGB(255, 0, 0, 0),
//                                   fontSize: 16),
//                             ),
//                       ),
//                       const SizedBox(
//                         height: 8.0,
//                       ),
//                       Text(
//                         "⭐${data['rating']}",
//                         style: Theme.of(context).textTheme.subtitle2!.merge(
//                               TextStyle(
//                                   fontWeight: FontWeight.w700,
//                                   color: Colors.black,
//                                   fontSize: 16),
//                             ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

///tampilan card list view
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../detailpage/detail_produk_ui.dart';
import 'package:umkm_store_apk3/view_models/cardProduk_viewModel.dart';

class GridB extends StatefulWidget {
  const GridB({Key? key}) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  @override
  void initState() {
    super.initState();
    CardProvider userProvider =
        Provider.of<CardProvider>(context, listen: false);
    userProvider.fetchDataProduk();
  }

  @override
  Widget build(BuildContext context) {
    CardProvider userProvider =
        Provider.of<CardProvider>(context, listen: false);
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        mainAxisExtent: 300,
      ),
      itemCount: userProvider.yh().length,
      itemBuilder: (_, index) {
        var data = userProvider.yh()[index].data() as Map<String, dynamic>;
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailPage(data: data)),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.grey.shade100,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4), // Warna bayangan abu-abu
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // Perubahan posisi bayangan
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: Image.network(
                    "${data['gambar_url']}",
                    height: 170,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "${data['nama_produk']}",
                        style: Theme.of(context).textTheme.subtitle1!.merge(
                              const TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "Rp${data['harga']}",
                        style: Theme.of(context).textTheme.subtitle2!.merge(
                              TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 16),
                            ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "⭐${data['rating']}",
                        style: Theme.of(context).textTheme.subtitle2!.merge(
                              TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                  fontSize: 16),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
