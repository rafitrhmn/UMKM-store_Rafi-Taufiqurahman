// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// import 'detail-toko.dart';

// class GridB extends StatefulWidget {
//   const GridB({Key? key}) : super(key: key);

//   @override
//   State<GridB> createState() => _GridBState();
// }

// class _GridBState extends State<GridB> {
//   final List<Map<String, dynamic>> gridMap = [
//     {
//       "title": "white sneaker with adidas logo",
//       "price": "\$255",
//       "images":
//           "https://firebasestorage.googleapis.com/v0/b/umkm-store-9f3cb.appspot.com/o/bakso-jati.webp?alt=media&token=50653116-17ca-4907-8e07-e65cd9a500f9&_gl=1*ohmdyj*_ga*MTU0NTE4NDU1NS4xNjk2NDA0NDE1*_ga_CW55HF8NVT*MTY5NzgxMDI4Ny45LjEuMTY5NzgxMTUyNC4zMy4wLjA",
//     },
//     {
//       "title": "Black Jeans with blue stripes",
//       "price": "\$245",
//       "images":
//           "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
//     },
//     {
//       "title": "Red shoes with black stripes",
//       "price": "\$155",
//       "images":
//           "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2hvZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
//     },
//     {
//       "title": "Gamma shoes with beta brand.",
//       "price": "\$275",
//       "images":
//           "https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
//     },
//     {
//       "title": "Alpha t-shirt for alpha testers.",
//       "price": "\$25",
//       "images":
//           "https://images.unsplash.com/photo-1583743814966-8936f5b7be1a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
//     },
//     {
//       "title": "Beta jeans for beta testers",
//       "price": "\$27",
//       "images":
//           "https://images.unsplash.com/photo-1602293589930-45aad59ba3ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
//     },
//     {
//       "title": "V&V  model white t shirts.",
//       "price": "\$55",
//       "images":
//           "https://images.unsplash.com/photo-1554568218-0f1715e72254?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
//     }
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 12.0,
//         mainAxisSpacing: 12.0,
//         mainAxisExtent: 310,
//       ),
//       itemCount: gridMap.length,
//       itemBuilder: (_, index) {
//         return Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(
//               16.0,
//             ),
//             color: Colors.amberAccent.shade100,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(16.0),
//                   topRight: Radius.circular(16.0),
//                 ),
//                 child: Image.network(
//                   "${gridMap.elementAt(index)['images']}",
//                   height: 170,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "${gridMap.elementAt(index)['title']}",
//                       style: Theme.of(context).textTheme.subtitle1!.merge(
//                             const TextStyle(
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                     ),
//                     const SizedBox(
//                       height: 8.0,
//                     ),
//                     Text(
//                       "${gridMap.elementAt(index)['price']}",
//                       style: Theme.of(context).textTheme.subtitle2!.merge(
//                             TextStyle(
//                               fontWeight: FontWeight.w700,
//                               color: Colors.grey.shade500,
//                             ),
//                           ),
//                     ),
//                     const SizedBox(
//                       height: 8.0,
//                     ),
//                     Row(
//                       children: [
//                         ElevatedButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => StorePage()),
//                             );
//                           },
//                           child: Text('Lihat Toko'),
//                           style: ElevatedButton.styleFrom(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 14, vertical: 4),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../model/api_service_data_umkm.dart';

class GridB extends StatefulWidget {
  const GridB({Key? key}) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  List<Map<String, dynamic>> gridMap = [];

  Future<void> fetchData() async {
    try {
      List<Map<String, dynamic>> data = await ApiService.fetchData();
      setState(() {
        gridMap = data;
      });
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        mainAxisExtent: 310,
      ),
      itemCount: gridMap.length,
      itemBuilder: (_, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              16.0,
            ),
            color: Colors.amberAccent.shade100,
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
                  "${gridMap.elementAt(index)['image']}",
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
                    Text(
                      "${gridMap.elementAt(index)['nama_toko']}",
                      style: Theme.of(context).textTheme.subtitle1!.merge(
                            const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      "${gridMap.elementAt(index)['rating']}",
                      style: Theme.of(context).textTheme.subtitle2!.merge(
                            TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.grey.shade500,
                            ),
                          ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StorePage()),
                            );
                          },
                          child: Text('Lihat Toko'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 14, vertical: 4),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Store Page'),
      ),
      body: Center(
        child: Text('This is the store page.'),
      ),
    );
  }
}
