// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';

// // import '../model/user_data.dart';
// // // import 'user.dart';

// // void main(List<String> args) {
// //   runApp(
// //     ChangeNotifierProvider(
// //       create: (context) => User(),
// //       child: MyApp(),
// //     ),
// //   );
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: LoginPage(),
// //     );
// //   }
// // }

// // class LoginPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     final user = Provider.of<User>(context, listen: true);

// //     return Scaffold(
// //       body: Padding(
// //         padding: const EdgeInsets.only(left: 60, right: 60),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: <Widget>[
// //             TextFormField(
// //               textInputAction: TextInputAction.next,
// //               decoration: InputDecoration(
// //                 labelText: 'Username',
// //                 border: OutlineInputBorder(),
// //               ),
// //               onChanged: (value) {
// //                 user.updateUsername(value);
// //               },
// //             ),
// //             const SizedBox(
// //               height: 20,
// //             ),
// //             TextFormField(
// //               obscureText: true,
// //               decoration: const InputDecoration(
// //                 labelText: 'Password',
// //                 border: OutlineInputBorder(),
// //               ),
// //               onChanged: (value) {
// //                 user.updatePassword(value);
// //               },
// //             ),
// //             const SizedBox(
// //               height: 20,
// //             ),
// //             ElevatedButton(
// //               onPressed: () {
// //                 // Implementasi logika login di sini
// //                 print('Username: ${user.username}, Password: ${user.password}');
// //               },
// //               child: const Text('Login'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:umkm_store_apk/model/api_service_login.dart';
// import 'package:umkm_store_apk/model/user_data.dart';

// void main(List<String> args) {
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

// class LoginPage extends StatelessWidget {
//   final ApiService apiService = ApiService(); // Membuat instance ApiService

//   void loginUser(BuildContext context, String username, String password) {

//   }

//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<User>(context, listen: true);

//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.only(left: 60, right: 60),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             TextFormField(
//               textInputAction: TextInputAction.next,
//               decoration: InputDecoration(
//                 labelText: 'Username',
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: (value) {
//                 user.updateUsername(value);
//               },
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             TextFormField(
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'Password',
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: (value) {
//                 user.updatePassword(value);
//               },
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 loginUser(context, user.username, user.password);
//               },
//               child: const Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:umkm_store_apk3/model/api_service_login.dart';
import 'package:umkm_store_apk3/model/user_data.dart';
import 'home.dart';

class LoginPage extends StatelessWidget {
  final ApiService apiService = ApiService();

  // void loginUser(BuildContext context, String username, String password) {
  //   apiService.loginUser(username, password).then((response) {
  //     print(response);
  //   }).catchError((e) {
  //     print('Error occurred: $e');
  //   });
  // }
  void loginUser(BuildContext context, String username, String password) {
    apiService.loginUser(username, password).then((response) {
      if (response == 'login_successful') {
        // Navigasi ke halaman baru setelah login berhasil
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      } else {
        // Tambahkan logika untuk menampilkan pesan kesalahan jika login gagal
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Username dan Password anda salah'),
        ));
      }
    }).catchError((e) {
      print('Error occurred: $e');
      // Tambahkan logika untuk menampilkan pesan kesalahan jika terjadi kesalahan pada aplikasi
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('An error occurred. Please try again later.'),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: true);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 60, right: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                user.updateUsername(value);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                user.updatePassword(value);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                loginUser(context, user.username, user.password);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Page'),
      ),
      body: Center(
        child: Text('You have successfully logged in!'),
      ),
    );
  }
}
