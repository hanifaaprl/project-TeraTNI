import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:projek1/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'masuk.dart'; // Pastikan halaman login diimpor dengan benar
import 'dashboard.dart'; // Pastikan halaman dashboard diimpor dengan benar

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MyApp({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light(useMaterial3: true),
      dark: ThemeData.dark(useMaterial3: true),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        theme: theme,
        darkTheme: darkTheme,
        home: SplashScreen(), // Mulai dengan SplashScreen untuk mengecek token
      ),
    );
  }
}

// SplashScreen untuk pengecekan token sebelum navigasi
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  // Fungsi untuk memeriksa token
  Future<void> _checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      // Token ada, periksa validitasnya
      final isValid = await _validateToken(token);

      if (isValid) {
        // Jika token valid, arahkan ke dashboard
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HalamanMasuk()),
        );
      } else {
        // Jika token tidak valid, hapus token dan arahkan ke halaman login
        await prefs.remove('token');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HalamanMasuk()),
        );
      }
    } else {
      // Jika token tidak ada, arahkan ke halaman login
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HalamanUtama()),
      );
    }
  }

  // Fungsi untuk validasi token (contoh sederhana)
  Future<bool> _validateToken(String token) async {
    try {
      // Logika validasi token, bisa dari request API atau cek expiry date
      // Gantikan dengan implementasi validasi token Anda
      // Misalnya, dengan request ke endpoint validasi
      return true; // Misal token valid untuk sementara
    } catch (e) {
      print('Error validating token: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Loading screen
      ),
    );
  }
}
