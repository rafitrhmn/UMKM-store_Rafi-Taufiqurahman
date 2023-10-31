import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:umkm_store_apk3/view_models/activity_viewModel.dart';
import 'package:umkm_store_apk3/view_models/cardProduk_viewModel.dart';
import 'package:umkm_store_apk3/view_models/login_viewModel.dart';
import 'package:umkm_store_apk3/views/activtypage/03-activity_page.dart';
import 'package:umkm_store_apk3/views/homepage/02-homepage.dart';
import 'package:umkm_store_apk3/views/pageLogin/01-login_ui.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:umkm_store_apk3/firebase_options.dart';

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
        ChangeNotifierProvider(create: (context) => ActivityProvider()),
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
