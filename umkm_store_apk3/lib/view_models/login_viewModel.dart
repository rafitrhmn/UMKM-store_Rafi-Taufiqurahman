// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/api_firebase/api_service_login.dart';

class UserProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _dataLogin = [];

  List<Map<String, dynamic>> get dataLogin => _dataLogin;

  Future<void> fetchDataLogin() async {
    try {
      List<Map<String, dynamic>> data = await ApiService.getDataLogin();
      _dataLogin = data;
      notifyListeners();
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

  bool loginVerification(context, String username, String password) {
    for (var data in _dataLogin) {
      if (data['username'] == username && data['password'] == password) {
        print('Login Successful');
        Navigator.pushNamed(context, '/home');
        return true;
      }
    }
    print('Login Failed');
    return false;
  }
}
