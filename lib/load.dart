import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:projek1/dashboard.dart';
import 'package:adaptive_theme/adaptive_theme.dart'; // Tambahkan package adaptive_theme
import 'colors.dart';

class HalamanVerifikasiBerhasil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan tema saat ini
    final theme = AdaptiveTheme.of(context);
    final isDarkMode = theme.mode.isDark;

    return Scaffold(
      //backgroundColor: isDarkMode ? Colors.black : Colors.white,
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/animation/cek.json', width: 150, height: 150),
            SizedBox(height: 20),
            Text(
              'Berhasil',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Selamat akun Anda',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: isDarkMode ? Colors.white70 : Colors.black87,
              ),
            ),
            Text(
              'telah berhasil didaftarkan',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: isDarkMode ? Colors.white70 : Colors.black87,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HalamanDashboard(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor, // Tetap menggunakan warna utama
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Masuk',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
