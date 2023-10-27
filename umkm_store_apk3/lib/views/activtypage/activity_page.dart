// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// import '../homepage/battom_navbar_ui.dart';
import '../widgets/battom_navbar_ui.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 53, left: 20, right: 20),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Align(
                child: Text(
                  'Activity',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey
                              .withOpacity(0.4), // Warna bayangan abu-abu
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // Perubahan posisi bayangan
                        ),
                      ],
                    ),
                    child: Row(children: [
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width / 4,
                        margin: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          'assets/images/icon-belanja.png',
                          width: 70,
                          height: 70,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 15, top: 20, bottom: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text('a')],
                          ),
                        ),
                      )
                    ]),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
