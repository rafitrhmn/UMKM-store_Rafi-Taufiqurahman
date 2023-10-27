// ///halaman detail produk jika user menekan card produk
// ///
// import 'package:flutter/material.dart';

// class DetailPage extends StatelessWidget {
//   final Map<String, dynamic> data;
//   final TextEditingController _inputController = TextEditingController();

//   DetailPage({Key? key, required this.data}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height / 2,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                   borderRadius: const BorderRadius.only(
//                     bottomLeft: Radius.circular(30),
//                     bottomRight: Radius.circular(30),
//                   ),
//                   image: DecorationImage(
//                     image: NetworkImage(data["gambar_url"]),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 child: Stack(
//                   children: [
//                     Positioned(
//                       top: 23,
//                       left: 15,
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.all(8),
//                           decoration: const BoxDecoration(
//                             color: Colors.white,
//                             shape: BoxShape.circle,
//                           ),
//                           child: const Icon(
//                             Icons.arrow_back_ios_new,
//                             size: 24,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20, top: 5, right: 20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "${data['nama_produk']}",
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 22,
//                         fontFamily: 'Montserrat',
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         Text(
//                           '⭐⭐⭐⭐⭐ ${data['rating']}',
//                           style: const TextStyle(
//                             fontFamily: 'Montserrat',
//                             fontSize: 20,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     Text(
//                       "Harga: Rp${data['harga']}",
//                       style: const TextStyle(
//                         fontFamily: 'Montserrat',
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.green,
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Text(
//                       "${data['deskripsi']}",
//                       style: const TextStyle(
//                           fontFamily: 'Montserrat',
//                           fontSize: 15,
//                           fontWeight: FontWeight.w100),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
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
//                       title: Text('Konfirmasi Pembelian'),
//                       content: TextFormField(
//                         controller: _inputController,
//                         decoration: InputDecoration(
//                             hintText: 'Masukkan jumlah pembelian'),
//                       ),
//                       actions: <Widget>[
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: Text('Batal'),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             String inputValue = _inputController.text;
//                             // Lakukan sesuatu dengan nilai yang dimasukkan
//                             Navigator.of(context).pop();
//                           },
//                           child: Text('Beli'),
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
//                       color: Colors.grey
//                           .withOpacity(0.4), // Warna bayangan abu-abu
//                       spreadRadius: 5,
//                       blurRadius: 7,
//                       offset: const Offset(0, 3), // Perubahan posisi bayangan
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

class DetailPage extends StatefulWidget {
  final Map<String, dynamic> data;

  DetailPage({Key? key, required this.data}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final TextEditingController _inputNamaController = TextEditingController();
  final TextEditingController _inputNoHpController = TextEditingController();
  final TextEditingController _inputAlamatController = TextEditingController();
  bool _isSelectedBsi = true;
  bool _isSelectedDana = false;
  bool _isSelectedCod = false;

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
                    image: NetworkImage(widget.data["gambar_url"]),
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
                      "${widget.data['nama_produk']}",
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
                          '⭐⭐⭐⭐⭐ ${widget.data['rating']}',
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Harga: Rp${widget.data['harga']}",
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "${widget.data['deskripsi']}",
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
