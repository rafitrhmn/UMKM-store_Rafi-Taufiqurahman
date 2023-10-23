import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user_data.dart';
import '../view/login.dart';

void main(List<String> args) {
  runApp(
    ChangeNotifierProvider(
      create: (context) => User(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
