///kode ketiga
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:umkm_store_apk3/view_models/activity_viewModel.dart';
import 'package:umkm_store_apk3/views/widgets/battom_navbar_ui.dart';
// import 'path_to_your_activity_provider.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final int nopage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 60,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Aktivitas',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
              Consumer<ActivityProvider>(
                builder: (context, activityProvider, _) {
                  List<Map<String, dynamic>> dataactivity =
                      activityProvider.use();
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: dataactivity.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> data = dataactivity[index];
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              padding: EdgeInsets.only(top: 2),
                              width: MediaQuery.of(context).size.width / 4,
                              margin: EdgeInsets.only(left: 10),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                child: Image.network(
                                  "${data['gambar_url']}",
                                  height: 50,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.8,
                              margin: EdgeInsets.only(left: 9),
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 2, top: 15, right: 7),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${data['nama_produk']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat',
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'nama pesanan : ${data['nama_pesanan']}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Montserrat-ExtraLight200',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.5,
                                    ),
                                    Text(
                                      'nomor handphone : ${data['no_hp']}',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 0.5,
                                    ),
                                    Text(
                                      'alamat : ${data['alamat']}',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 0.5,
                                    ),
                                    Text(
                                      'metode pembayaran : ${data['metode_pembayaran']}',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    // Text('Alamat: ${data['alamat']}'),
                                    // Text('Nomor Handphone: ${data['no_hp']}'),
                                    // Text('Harga: ${data['harga']}'),
                                    // Text(
                                    //     'Nama Pesanan: ${data['nama_pesanan']}'),
                                    // Text(
                                    //     'Metode Pembayaran: ${data['metode_pembayaran']}'),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: nopage,
      ),
    );
  }
}
