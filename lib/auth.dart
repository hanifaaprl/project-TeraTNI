import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String apiUrl = "https://tera-tni-api.onrender.com/v1/auth/login";

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

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        return {
          'success': true,
          'message': data['message'] ?? 'Login berhasil',
          'token': data['token'] ?? '',
        };
      } else {
        return {
          'success': false,
          'message': json.decode(response.body)['message'] ?? 'Login gagal',
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
