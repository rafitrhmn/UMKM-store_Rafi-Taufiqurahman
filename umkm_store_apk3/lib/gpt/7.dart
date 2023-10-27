// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Simple Flutter Page',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: SimplePage(title: 'Simple Flutter Page'),
//     );
//   }
// }

// class SimplePage extends StatefulWidget {
//   final String title;
//   SimplePage({Key? key, required this.title}) : super(key: key);

//   @override
//   _SimplePageState createState() => _SimplePageState();
// }

// class _SimplePageState extends State<SimplePage> {
//   final TextEditingController _inputNamaController = TextEditingController();
//   final TextEditingController _inputNoHpController = TextEditingController();
//   final TextEditingController _inputAlamatController = TextEditingController();
//   bool _isSelectedBsi = false;
//   bool _isSelectedDana = false;
//   bool _isSelectedCod = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'Welcome to your Simple Flutter Page',
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Add your button press logic here
//               },
//               child: const Text('Click Me'),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         height: 70,
//         margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             InkWell(
//               onTap: () {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text('Konfirmasi Pesanan'),
//                       content: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const Text(
//                             'Nama Pesanan',
//                             style: TextStyle(
//                                 fontSize: 16, fontFamily: 'Montserrat'),
//                           ),
//                           TextFormField(
//                               controller: _inputNamaController,
//                               decoration: const InputDecoration(
//                                   counterText: '',
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Colors.grey, width: 2.0),
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(20)),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                           color: Colors.black, width: 1.0),
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(20.0)))),
//                               keyboardType: TextInputType.name,
//                               textAlign: TextAlign.left),
//                           const SizedBox(height: 10),
//                           const Text(
//                             'Nomor HandPhone',
//                             style: TextStyle(
//                                 fontSize: 16, fontFamily: 'Montserrat'),
//                           ),
//                           TextFormField(
//                               controller: _inputNoHpController,
//                               decoration: const InputDecoration(
//                                   counterText: '',
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Colors.grey, width: 2.0),
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(20)),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                           color: Colors.black, width: 1.0),
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(20.0)))),
//                               keyboardType: TextInputType.number,
//                               textAlign: TextAlign.left),
//                           const SizedBox(height: 10),
//                           const Text(
//                             'Alamat Pengiriman',
//                             style: TextStyle(
//                                 fontSize: 16, fontFamily: 'Montserrat'),
//                           ),
//                           TextFormField(
//                               controller: _inputAlamatController,
//                               decoration: const InputDecoration(
//                                   counterText: '',
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide: BorderSide(
//                                         color: Colors.grey, width: 2.0),
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(20)),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                           color: Colors.black, width: 1.0),
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(20.0)))),
//                               keyboardType: TextInputType.streetAddress,
//                               textAlign: TextAlign.left),
//                           SizedBox(height: 10),
//                           const Text(
//                             'Pilih Metode Pembayaran',
//                             style: TextStyle(
//                                 fontSize: 16, fontFamily: 'Montserrat'),
//                           ),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: Radio<bool>(
//                                   value: _isSelectedBsi,
//                                   groupValue: true,
//                                   onChanged: (bool? value) {
//                                     setState(() {
//                                       _isSelectedBsi = true;
//                                       _isSelectedDana = false;
//                                       _isSelectedCod = false;
//                                     });
//                                   },
//                                   activeColor: _isSelectedBsi
//                                       ? Colors.blue
//                                       : Colors.grey,
//                                 ),
//                               ),
//                               const Text('BSI'),
//                               Expanded(
//                                 child: Radio<bool>(
//                                   value: _isSelectedDana,
//                                   groupValue: true,
//                                   onChanged: (bool? value) {
//                                     setState(() {
//                                       _isSelectedDana = true;
//                                       _isSelectedBsi = false;
//                                       _isSelectedCod = false;
//                                     });
//                                   },
//                                   activeColor: _isSelectedDana
//                                       ? Colors.blue
//                                       : Colors.grey,
//                                 ),
//                               ),
//                               const Text('Dana'),
//                               Expanded(
//                                 child: Radio<bool>(
//                                   value: _isSelectedCod,
//                                   groupValue: true,
//                                   onChanged: (bool? value) {
//                                     setState(() {
//                                       _isSelectedCod = true;
//                                       _isSelectedDana = false;
//                                       _isSelectedBsi = false;
//                                     });
//                                   },
//                                   activeColor: _isSelectedCod
//                                       ? Colors.blue
//                                       : Colors.grey,
//                                 ),
//                               ),
//                               const Text('COD'),
//                             ],
//                           ),
//                         ],
//                       ),
//                       actions: <Widget>[
//                         ElevatedButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: Text(
//                             'Batal',
//                             style: TextStyle(
//                                 color: Colors.white, fontFamily: 'Montserrat'),
//                           ),
//                           style: ElevatedButton.styleFrom(
//                             primary: Colors.red,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             elevation: 7,
//                           ),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             // String name = _inputController.text;
//                             // Lakukan sesuatu dengan nilai yang dimasukkan
//                             Navigator.of(context).pop();
//                           },
//                           child: Text(
//                             'Beli',
//                             style: TextStyle(
//                                 color: Colors.white, fontFamily: 'Montserrat'),
//                           ),
//                           style: ElevatedButton.styleFrom(
//                             primary: Colors.green,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             elevation: 7,
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//               child: Container(
//                 height: 60,
//                 width: MediaQuery.of(context).size.width / 1.11,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.4),
//                       spreadRadius: 5,
//                       blurRadius: 7,
//                       offset: const Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'Beli Sekarang',
//                     style: TextStyle(
//                         fontSize: 19,
//                         fontFamily: 'Montserrat',
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Flutter Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SimplePage(title: 'Simple Flutter Page'),
    );
  }
}

class SimplePage extends StatefulWidget {
  final String title;
  SimplePage({Key? key, required this.title}) : super(key: key);

  @override
  _SimplePageState createState() => _SimplePageState();
}

class _SimplePageState extends State<SimplePage> {
  final TextEditingController _inputNamaController = TextEditingController();
  final TextEditingController _inputNoHpController = TextEditingController();
  final TextEditingController _inputAlamatController = TextEditingController();
  bool _isSelectedBsi = true;
  bool _isSelectedDana = false;
  bool _isSelectedCod = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to your Simple Flutter Page',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your button press logic here
              },
              child: const Text('Click Me'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: AlertDialog(
                        title: Text('Konfirmasi Pesanan'),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Nama Pesanan',
                              style: TextStyle(
                                  fontSize: 16, fontFamily: 'Montserrat'),
                            ),
                            TextFormField(
                              controller: _inputNamaController,
                              decoration: const InputDecoration(
                                counterText: '',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                ),
                              ),
                              keyboardType: TextInputType.name,
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Nomor HandPhone',
                              style: TextStyle(
                                  fontSize: 16, fontFamily: 'Montserrat'),
                            ),
                            TextFormField(
                              controller: _inputNoHpController,
                              decoration: const InputDecoration(
                                counterText: '',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Alamat Pengiriman',
                              style: TextStyle(
                                  fontSize: 16, fontFamily: 'Montserrat'),
                            ),
                            TextFormField(
                              controller: _inputAlamatController,
                              decoration: const InputDecoration(
                                counterText: '',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                ),
                              ),
                              keyboardType: TextInputType.streetAddress,
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 10),
                            const Text(
                              'Pilih Metode Pembayaran',
                              style: TextStyle(
                                  fontSize: 16, fontFamily: 'Montserrat'),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Radio<bool>(
                                    value: _isSelectedBsi,
                                    groupValue: true,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isSelectedBsi = true;
                                        _isSelectedDana = false;
                                        _isSelectedCod = false;
                                      });
                                    },
                                    activeColor: _isSelectedBsi
                                        ? Colors.blue
                                        : Colors.grey,
                                  ),
                                ),
                                const Text('BSI'),
                                Expanded(
                                  child: Radio<bool>(
                                    value: _isSelectedDana,
                                    groupValue: true,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isSelectedDana = true;
                                        _isSelectedBsi = false;
                                        _isSelectedCod = false;
                                      });
                                    },
                                    activeColor: _isSelectedDana
                                        ? Colors.blue
                                        : Colors.grey,
                                  ),
                                ),
                                const Text('Dana'),
                                Expanded(
                                  child: Radio<bool>(
                                    value: _isSelectedCod,
                                    groupValue: true,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _isSelectedCod = true;
                                        _isSelectedDana = false;
                                        _isSelectedBsi = false;
                                      });
                                    },
                                    activeColor: _isSelectedCod
                                        ? Colors.blue
                                        : Colors.grey,
                                  ),
                                ),
                                const Text('COD'),
                              ],
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Batal',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat'),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 7,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // String name = _inputController.text;
                              // Lakukan sesuatu dengan nilai yang dimasukkan
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Beli',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat'),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 7,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 1.11,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
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
