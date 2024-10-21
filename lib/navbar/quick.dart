import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:projek1/colors.dart';

class QuickCount extends StatefulWidget {
  @override
  _QuickCountState createState() => _QuickCountState();
}

class _QuickCountState extends State<QuickCount> {
  // Daftar untuk menyimpan kontainer TPS baru
  List<Widget> tpsContainers = [];

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context);
    final isDarkMode = theme.mode.isDark;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
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
                          'Pengumpulan Hitung Cepat',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Gubernur Jawa Barat',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Tambahkan kontainer TPS baru
                      setState(() {
                        tpsContainers.add(_buildTPSContainer(isDarkMode));
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Send',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Kontainer utama untuk formulir TPS
                _buildTPSContainer(isDarkMode),

                // Daftar kontainer TPS baru yang ditambahkan
                Column(
                  children: tpsContainers,
                ),

                SizedBox(height: 20),

                // Tombol Hapus dan Tambah
                Center(
                  child: Column(
                    children: [
                      // Tombol Hapus
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 30,
                        ),
                        onPressed: () {
                          // Logika ketika tombol Hapus ditekan
                          // Hapus semua kontainer TPS
                          setState(() {
                            tpsContainers.clear();
                          });
                        },
                      ),
                      SizedBox(height: 10),

                      // Tombol Tambah
                      ElevatedButton(
                        onPressed: () {
                          // Tambahkan kontainer TPS baru
                          setState(() {
                            tpsContainers.add(_buildTPSContainer(isDarkMode));
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: primaryColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: 110, vertical: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: Text(
                          'Tambah',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk membangun kontainer TPS
  Widget _buildTPSContainer(bool isDarkMode) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10), // Beri jarak antar kontainer
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
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10),
            _buildTextField('Nama TPS', isDarkMode),
            SizedBox(height: 10),
            _buildTextField('Lokasi TPS', isDarkMode),
            SizedBox(height: 10),
            _buildTextField('Nomor Telepon', isDarkMode),
            SizedBox(height: 10),
            _buildTextField('Suara Kandidat 1', isDarkMode),
            SizedBox(height: 10),
            _buildTextField('Suara Kandidat 2', isDarkMode),
            SizedBox(height: 10),
            _buildTextField('Suara Kandidat 3', isDarkMode),
            SizedBox(height: 10),
            _buildTextField('Suara Tidak Sah', isDarkMode),
            SizedBox(height: 10),
            _buildTextField('Total DPT', isDarkMode),
          ],
        ),
      ),
    );
  }
}

// Widget untuk TextField yang digunakan pada Formulir
Widget _buildTextField(String labelText, bool isDarkMode) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        labelText,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white70,
          //color: isDarkMode ? Colors.white70 : Colors.black87,
        ),
      ),
      SizedBox(height: 8),
      Container(
        height: 45,
        child: TextField(
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            //color: isDarkMode ? Colors.white : Colors.black,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: primaryColor,
                  width: 1.0), // Mengatur ketebalan garis pinggir
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: primaryColor,
                  width: 1.0), // Menambahkan garis putih untuk border normal
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: primaryColor, width: 1.0), // Garis putih saat fokus
            ),
            filled: true,
            fillColor: secondaryColor,
          ),
        ),
      ),
    ],
  );
}
