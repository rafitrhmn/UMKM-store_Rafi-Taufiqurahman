import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String username = '';
  String password = '';

  void updateUsername(String newUsername) {
    username = newUsername;
    notifyListeners();
  }

  void updatePassword(String newPassword) {
    password = newPassword;
    notifyListeners();
  }
}
