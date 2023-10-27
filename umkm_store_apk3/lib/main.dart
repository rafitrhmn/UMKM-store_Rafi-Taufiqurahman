// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:umkm_store_apk3/firebase_options.dart';

// import '../models/provider/provider_user.dart';
// import '../views/pageLogin/login_ui.dart';

// void main(List<String> args) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => User(),
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LoginPage(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:umkm_store_apk3/view_models/cardProduk_viewModel.dart';
import 'package:umkm_store_apk3/view_models/login_viewModel.dart';
import 'package:umkm_store_apk3/views/activtypage/activity_page.dart';
import 'package:umkm_store_apk3/views/homepage/homepage.dart';
import 'package:umkm_store_apk3/views/pageLogin/login_ui.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:umkm_store_apk3/firebase_options.dart';
// import 'login_viewModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => CardProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => MyHomePage(),
        '/activity': (context) => ActivityPage(),
      },
    );
  }
}
