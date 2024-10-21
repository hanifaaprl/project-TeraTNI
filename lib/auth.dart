import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String apiUrl = "https://teratni.pindadtest.com"; 

  // Fungsi untuk login
  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      // Kirim POST request dengan body JSON
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        // Jika login berhasil
        final Map<String, dynamic> data = json.decode(response.body);
        return {
          'success': true,
          'message': data['message'],
          'token': data['token'],
        };
      } else {
        // Jika login gagal
        return {
          'success': false,
          'message': json.decode(response.body)['message'],
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Terjadi kesalahan. Coba lagi nanti.',
      };
    }
  }
}
