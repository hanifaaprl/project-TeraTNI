import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:projek1/colors.dart';

class FormLingkungan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context);
    final isDarkMode = theme.mode.isDark;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          // Header
          Positioned(
            top: 40,
            left: 10,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 24,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lingkungan',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Kontainer utama
          Positioned(
            top: 100,
            left: 16,
            right: 16,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: secondaryColor,
                //color: isDarkMode ? Colors.grey[800] : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(2, 2),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        'Form Lingkungan',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildTextField('Berapa luas tanah yang anda punya?', isDarkMode),
                    SizedBox(height: 10),
                    _buildTextField('Bagaimana SDA disekitar lingkungan anda?', isDarkMode),
                    SizedBox(height: 10),
                    _buildTextField('Bagaimana keamanan disekitar lingkungan anda?', isDarkMode),
                    SizedBox(height: 10),
                    _buildTextField('Bagaimana kondisi tanah disekitar lingkungan anda?', isDarkMode, maxLines: 3),
                    SizedBox(height: 10),
                    _buildTextField('Dimana lokasi strategis disekitar lingkungan anda?', isDarkMode),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Logika ketika tombol Daftar ditekan
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: primaryColor,
                          padding: EdgeInsets.symmetric(horizontal: 110, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          'Tambah Data',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget untuk TextField yang digunakan pada Formulir
Widget _buildTextField(String labelText, bool isDarkMode, {int maxLines = 3}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        labelText,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white70,
          //color: isDarkMode ? Colors.white70 : Colors.black87,
        ),
      ),
      SizedBox(height: 8),
      Container(
        height: 45,
        child: TextField(
          maxLines: maxLines,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white, width: 1.0), // Mengatur ketebalan garis pinggir
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white, width: 1.0), // Menambahkan garis putih untuk border normal
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white, width: 1.0), // Garis putih saat fokus
              ),
            filled: true,
            fillColor: secondaryColor,
          ),
        ),
      ),
    ],
  );
}
