import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:projek1/colors.dart';

class EditSosialEkonomi extends StatelessWidget {
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
                      'Sosial Ekonomi',
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
                        'Edit Data',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildTextField('Apa partai polotik yang paling dominan di daerah anda?', isDarkMode),
                    SizedBox(height: 10),
                    _buildTextField('Berapa jumlah pasar yang ada di daerah anda?', isDarkMode),
                    SizedBox(height: 10),
                    _buildTextField('Berapa jumlah mall yang ada di daerah anda?', isDarkMode),
                    SizedBox(height: 10),
                    _buildTextField('Bagaimana perkembangan ekonomi di daerah anda?', isDarkMode, maxLines: 3),
                    SizedBox(height: 10),
                    _buildTextField('Apakah anda sudah memiliki E-KTP?', isDarkMode),
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
                          'Edit Data',
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
            //color: isDarkMode ? Colors.white : Colors.black,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: primaryColor,
              ),
            ),
            filled: true,
            fillColor: secondaryColor,
            // fillColor: isDarkMode ? Colors.grey[850] : Colors.white,
          ),
        ),
      ),
    ],
  );
}
