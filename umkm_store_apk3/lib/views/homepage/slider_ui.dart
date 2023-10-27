///slider kosongan
import 'package:flutter/material.dart';
import 'dart:async';

class CustomSizedBoxSlider extends StatefulWidget {
  @override
  _CustomSizedBoxSliderState createState() => _CustomSizedBoxSliderState();
}

class _CustomSizedBoxSliderState extends State<CustomSizedBoxSlider> {
  int pageNo = 0;
  PageController pageController = PageController(viewportFraction: 0.8);
  Timer? carasouelTmer;

  Timer? getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (pageNo < 4) {
        pageNo++;
        pageController.animateToPage(
          pageNo,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      } else {
        pageNo = 0;
        pageController.animateToPage(
          pageNo,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    carasouelTmer = getTimer();
  }

  @override
  void dispose() {
    pageController.dispose();
    carasouelTmer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (index) {
              pageNo = index;
              setState(() {});
            },
            itemBuilder: (_, index) {
              return AnimatedBuilder(
                animation: pageController,
                builder: (ctx, child) {
                  return GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Hello you tapped at ${index + 1} "),
                        ),
                      );
                    },
                    onPanDown: (d) {
                      carasouelTmer?.cancel();
                      carasouelTmer = null;
                    },
                    onPanCancel: () {
                      carasouelTmer = getTimer();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                          right: 8, left: 8, top: 24, bottom: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: Colors.amberAccent,
                      ),
                    ),
                  );
                },
              );
            },
            itemCount: 5,
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) => GestureDetector(
              child: Container(
                margin: const EdgeInsets.all(2.0),
                child: Icon(
                  Icons.circle,
                  size: 12.0,
                  color: pageNo == index
                      ? Colors.indigoAccent
                      : Colors.grey.shade300,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


///kode untuk menampilkan gambar menampilkan gambar dari api _service_slider.dart
///
// import 'package:flutter/material.dart';
// import 'dart:async';

// import 'package:umkm_store_apk3/model/api_firebase/api_service_slider.dart';

// class CustomSizedBoxSlider extends StatefulWidget {
//   @override
//   _CustomSizedBoxSliderState createState() => _CustomSizedBoxSliderState();
// }

// class _CustomSizedBoxSliderState extends State<CustomSizedBoxSlider> {
//   int pageNo = 0;
//   PageController pageController = PageController(viewportFraction: 0.8);
//   Timer? carasouelTmer;

//   Timer? getTimer() {
//     return Timer.periodic(const Duration(seconds: 3), (Timer timer) {
//       if (pageNo < 4) {
//         pageNo++;
//         pageController.animateToPage(
//           pageNo,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeIn,
//         );
//       } else {
//         pageNo = 0;
//         pageController.animateToPage(
//           pageNo,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeIn,
//         );
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     carasouelTmer = getTimer();
//   }

//   @override
//   void dispose() {
//     pageController.dispose();
//     carasouelTmer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 200,
//           child: PageView.builder(
//             controller: pageController,
//             onPageChanged: (index) {
//               pageNo = index;
//               setState(() {});
//             },
//             itemBuilder: (_, index) {
//               return AnimatedBuilder(
//                 animation: pageController,
//                 builder: (ctx, child) {
//                   return GestureDetector(
//                     onTap: () {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text("Hello you tapped at ${index + 1} "),
//                         ),
//                       );
//                     },
//                     onPanDown: (d) {
//                       carasouelTmer?.cancel();
//                       carasouelTmer = null;
//                     },
//                     onPanCancel: () {
//                       carasouelTmer = getTimer();
//                     },
//                     child: Container(
//                       margin: const EdgeInsets.only(
//                           right: 8, left: 8, top: 24, bottom: 12),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(24.0),
//                         color: Colors.amberAccent,
//                       ),
//                       child: FutureBuilder<List<String>>(
//                         future: FirestoreService.getImageUrl(),
//                         builder: (BuildContext context,
//                             AsyncSnapshot<List<String>> snapshot) {
//                           if (snapshot.connectionState ==
//                               ConnectionState.done) {
//                             if (snapshot.hasError) {
//                               return Text('Error: ${snapshot.error}');
//                             } else if (snapshot.hasData &&
//                                 snapshot.data != null) {
//                               List<String> imageUrls = snapshot.data!;
//                               return buildImageWidget(imageUrls);
//                             } else {
//                               return Text('No data available');
//                             }
//                           } else {
//                             return CircularProgressIndicator();
//                           }
//                         },
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//             itemCount: 5,
//           ),
//         ),
//         const SizedBox(
//           height: 12.0,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: List.generate(
//             5,
//             (index) => GestureDetector(
//               child: Container(
//                 margin: const EdgeInsets.all(2.0),
//                 child: Icon(
//                   Icons.circle,
//                   size: 12.0,
//                   color: pageNo == index
//                       ? Colors.indigoAccent
//                       : Colors.grey.shade300,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// Widget buildImageWidget(List<String> imageUrls) {
//   return Column(
//     children: List.generate(
//       5,
//       (index) {
//         if (index < imageUrls.length) {
//           return Container(
//             margin:
//                 const EdgeInsets.only(right: 8, left: 8, top: 24, bottom: 8),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(24.0),
//               color: Colors.amberAccent,
//               image: DecorationImage(
//                 image: NetworkImage(imageUrls[index]),
//                 fit: BoxFit
//                     .cover, // Mengatur gambar agar sesuai dengan ukuran wadah
//               ),
//             ),
//           );
//         } else {
//           // Jika tidak ada gambar yang cukup, tampilkan wadah kosong
//           return Container(
//             margin:
//                 const EdgeInsets.only(right: 8, left: 8, top: 24, bottom: 8),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(24.0),
//               color: Colors.amberAccent,
//             ),
//           );
//         }
//       },
//     ),
//   );
// }





// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

// class CustomSizedBoxSlider extends StatefulWidget {
//   @override
//   _CustomSizedBoxSliderState createState() => _CustomSizedBoxSliderState();
// }

// class _CustomSizedBoxSliderState extends State<CustomSizedBoxSlider> {
//   int pageNo = 0;
//   PageController pageController = PageController(viewportFraction: 0.8);
//   Timer? carasouelTmer;

//   Timer? getTimer() {
//     return Timer.periodic(const Duration(seconds: 3), (Timer timer) {
//       if (pageNo < 4) {
//         pageNo++;
//         pageController.animateToPage(
//           pageNo,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeIn,
//         );
//       } else {
//         pageNo = 0;
//         pageController.animateToPage(
//           pageNo,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeIn,
//         );
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     carasouelTmer = getTimer();
//   }

//   @override
//   void dispose() {
//     pageController.dispose();
//     carasouelTmer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 200,
//           child: PageView.builder(
//             controller: pageController,
//             onPageChanged: (index) {
//               pageNo = index;
//               setState(() {});
//             },
//             itemBuilder: (_, index) {
//               return AnimatedBuilder(
//                 animation: pageController,
//                 builder: (ctx, child) {
//                   return GestureDetector(
//                     onTap: () {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text("Hello you tapped at ${index + 1} "),
//                         ),
//                       );
//                     },
//                     onPanDown: (d) {
//                       carasouelTmer?.cancel();
//                       carasouelTmer = null;
//                     },
//                     onPanCancel: () {
//                       carasouelTmer = getTimer();
//                     },
//                     child: Container(
//                       margin: const EdgeInsets.only(
//                           right: 8, left: 8, top: 24, bottom: 12),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(24.0),
//                         color: Colors.amberAccent,
//                       ),
//                       child: FutureBuilder(
//                         future: firebase_storage.FirebaseStorage.instance
//                             .ref('your-folder-path/your-image-file-name.jpg')
//                             .getDownloadURL(),
//                         builder: (BuildContext context,
//                             AsyncSnapshot<String> snapshot) {
//                           if (snapshot.hasData) {
//                             return Image.network(
//                               snapshot.data!,
//                               fit: BoxFit.cover, // Atur sesuai kebutuhan Anda
//                             );
//                           } else if (snapshot.hasError) {
//                             return Text('Error in downloading image');
//                           } else {
//                             return CircularProgressIndicator(); // Atau widget placeholder lainnya
//                           }
//                         },
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//             itemCount: 5,
//           ),
//         ),
//         const SizedBox(
//           height: 12.0,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: List.generate(
//             5,
//             (index) => GestureDetector(
//               child: Container(
//                 margin: const EdgeInsets.all(2.0),
//                 child: Icon(
//                   Icons.circle,
//                   size: 12.0,
//                   color: pageNo == index
//                       ? Colors.indigoAccent
//                       : Colors.grey.shade300,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

// class CustomSizedBoxSlider extends StatefulWidget {
//   @override
//   _CustomSizedBoxSliderState createState() => _CustomSizedBoxSliderState();
// }

// class _CustomSizedBoxSliderState extends State<CustomSizedBoxSlider> {
//   int pageNo = 0;
//   PageController pageController = PageController(viewportFraction: 0.8);
//   Timer? carasouelTmer;

//   Timer? getTimer() {
//     return Timer.periodic(const Duration(seconds: 3), (Timer timer) {
//       if (pageNo < 4) {
//         pageNo++;
//         pageController.animateToPage(
//           pageNo,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeIn,
//         );
//       } else {
//         pageNo = 0;
//         pageController.animateToPage(
//           pageNo,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeIn,
//         );
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     carasouelTmer = getTimer();
//   }

//   @override
//   void dispose() {
//     pageController.dispose();
//     carasouelTmer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 200,
//           child: PageView.builder(
//             controller: pageController,
//             onPageChanged: (index) {
//               pageNo = index;
//               setState(() {});
//             },
//             itemBuilder: (_, index) {
//               return AnimatedBuilder(
//                 animation: pageController,
//                 builder: (ctx, child) {
//                   return GestureDetector(
//                     onTap: () {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text("Hello you tapped at ${index + 1} "),
//                         ),
//                       );
//                     },
//                     onPanDown: (d) {
//                       carasouelTmer?.cancel();
//                       carasouelTmer = null;
//                     },
//                     onPanCancel: () {
//                       carasouelTmer = getTimer();
//                     },
//                     child: Container(
//                       margin: const EdgeInsets.only(
//                           right: 8, left: 8, top: 24, bottom: 12),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(24.0),
//                         color: Colors.amberAccent,
//                       ),
//                       child: FutureBuilder(
//                         future: firebase_storage.FirebaseStorage.instance
//                             .ref('your-folder-path/your-image-file-name.jpg')
//                             .getDownloadURL(),
//                         builder: (BuildContext context,
//                             AsyncSnapshot<String> snapshot) {
//                           if (snapshot.hasData) {
//                             return Image.network(
//                               snapshot.data!,
//                               fit: BoxFit.cover, // Atur sesuai kebutuhan Anda
//                             );
//                           } else if (snapshot.hasError) {
//                             return Text('Error in downloading image');
//                           } else {
//                             return CircularProgressIndicator(); // Atau widget placeholder lainnya
//                           }
//                         },
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//             itemCount: 5,
//           ),
//         ),
//         const SizedBox(
//           height: 12.0,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: List.generate(
//             5,
//             (index) => GestureDetector(
//               child: Container(
//                 margin: const EdgeInsets.all(2.0),
//                 child: Icon(
//                   Icons.circle,
//                   size: 12.0,
//                   color: pageNo == index
//                       ? Colors.indigoAccent
//                       : Colors.grey.shade300,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
