import 'package:dio/dio.dart';

class ApiService {
  static Future<List<Map<String, dynamic>>> getDataLogin() async {
    try {
      final response =
          await Dio().get('https://651fca6a906e276284c382ae.mockapi.io/users');
      if (response.statusCode == 200) {
        List<Map<String, dynamic>> data =
            List<Map<String, dynamic>>.from(response.data);
        return data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}
