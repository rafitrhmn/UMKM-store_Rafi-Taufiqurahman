import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:umkm_store_apk3/view_models/activity_viewModel.dart';

class CustomBottomNavBar extends StatefulWidget {
  final Map<String, dynamic> data; //field menampung data

  const CustomBottomNavBar({Key? key, required this.data})
      : super(key: key); //konstarktor custombattomnavbar
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final TextEditingController _inputNamaController = TextEditingController();
  final TextEditingController _inputNoHpController = TextEditingController();
  final TextEditingController _inputAlamatController = TextEditingController();
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Material(
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SingleChildScrollView(
                      child: alertDialog(context),
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
                    'Pesan Sekarang',
                    style: TextStyle(
                        fontSize: 19,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AlertDialog alertDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Konfirmasi Pesanan'),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Nama Pesanan',
                style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
              ),
              TextFormField(
                controller: _inputNamaController,
                decoration: const InputDecoration(
                  counterText: '',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                keyboardType: TextInputType.name,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              const Text(
                'Nomor HandPhone',
                style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
              ),
              TextFormField(
                controller: _inputNoHpController,
                decoration: const InputDecoration(
                  counterText: '',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              const Text(
                'Alamat',
                style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
              ),
              TextFormField(
                controller: _inputAlamatController,
                decoration: const InputDecoration(
                  counterText: '',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                keyboardType: TextInputType.streetAddress,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              const Text(
                'Pilih Metode Pembayaran',
                style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
              ),
              Row(
                children: [
                  Radio<String>(
                    value: "Transfer Bank",
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value;
                        // print(value);
                      });
                    },
                  ),
                  const Text("Transfer Bank"),
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    value: "Dana",
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value;
                        // print(value);
                      });
                    },
                  ),
                  const Text("Dana"),
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    value: "COD",
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value;
                        // print(value);
                      });
                    },
                  ),
                  const Text("COD"),
                ],
              ),
            ],
          );
        },
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Batal',
            style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
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
            if (_inputNamaController.text.isEmpty ||
                _inputNoHpController.text.isEmpty ||
                _inputAlamatController.text.isEmpty ||
                _selectedValue!.isEmpty) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Kesalahan'),
                    content:
                        const Text('Harap isi semua data sebelum melanjutkan.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            } else if (!_isNumeric(_inputNoHpController.text)) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text(
                      'Kesalahan',
                      style: TextStyle(fontFamily: 'Montserrat'),
                    ),
                    content: const Text('Nomor HandPhone harus berupa angka'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              );
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text(
                      'Berhasil Memesan',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                    content: const Text(
                        'Terima kasih telah memesan produk local UMKM kami'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          ActivityProvider activityProvider =
                              Provider.of<ActivityProvider>(context,
                                  listen: false);
                          Map<String, dynamic> orderData = {
                            'gambar_url': widget.data["gambar_url"],
                            'nama_produk': widget.data["nama_produk"],
                            'harga': widget.data["harga"],
                            'nama_pesanan': _inputNamaController.text,
                            'no_hp': _inputNoHpController.text,
                            'alamat': _inputAlamatController.text,
                            'metode_pembayaran': _selectedValue,
                          };
                          activityProvider.addData(orderData);
                          Navigator.pop(context);
                        },
                        child: const Text('OK'),
                        // Navigator.of(context).pop();
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: const Text(
            'Pesan',
            style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
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
    );
  }
}

bool _isNumeric(String s) {
  // ignore: unnecessary_null_comparison
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}
