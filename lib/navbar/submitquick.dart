import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String apiUrl = "https://tera-tni-api.onrender.com/v1/auth/login";

  Future<Map<String, dynamic>> submit(String username, String password) async {
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

      // Periksa apakah status code 200 (OK) atau 201 (Created)
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> data = json.decode(response.body);

        // Log jika token tersedia
        if (data['data'] != null && data['data']['token'] != null) {
          print('Token: ${data['data']['token']}');
        }

        return {
          'success': true,
          'message': 'Login berhasil',
          'token': data['data']['token'] ?? '',
          'refreshToken': data['data']['refreshToken'] ?? '',
        };
      } else {
        // Jika status code tidak 200/201, maka dianggap gagal
        final Map<String, dynamic> errorData = json.decode(response.body);
        return {
          'success': false,
          'message': errorData['message'] ?? 'Login gagal',
        };
      }
    } catch (e) {
      print('Error during login: $e');
      return {
        'success': false,
        'message': 'Terjadi kesalahan. Coba lagi nanti.',
      };
    }
  }
}
