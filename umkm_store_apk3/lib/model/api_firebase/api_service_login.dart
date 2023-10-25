import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<String> loginUser(String username, String password) async {
    try {
      Response response = await _dio.get(
          'https://651fca6a906e276284c382ae.mockapi.io/users'); // Ganti dengan URL API MockAPI Anda

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;

        for (var item in data) {
          if (item['username'] == username && item['password'] == password) {
            return 'login_successful';
          }
        }

        return 'login_failed';
      } else {
        return 'login_failed';
      }
    } catch (e) {
      print('Error occurred: $e');
      rethrow;
    }
  }
}
