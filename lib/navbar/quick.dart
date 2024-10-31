import 'dart:convert';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:projek1/colors.dart';
import 'package:http/http.dart' as http;

class QuickCount extends StatefulWidget {
  @override
  _QuickCountState createState() => _QuickCountState();
}

class _QuickCountState extends State<QuickCount> {
  List<Map<String, dynamic>> tpsData = []; // Data TPS yang akan dikirim ke API
  List<Widget> tpsContainers = []; // Daftar untuk menyimpan kontainer TPS baru

  // Fungsi untuk mengirim data ke API
  Future<void> sendDataToApi() async {
    final url = Uri.parse(
        'https://tera-tni-api.onrender.com/v1/quick-counts/transactions'); // Ganti dengan URL API Anda

    final requestBody = {
      "selectionId": 2,
      "transactions": tpsData,
    };

    try {
      print("Mengirim data: ${jsonEncode(requestBody)}");

      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InNvcmVhbmciLCJzdWIiOjYsImlhdCI6MTczMDM0MzE5NywiZXhwIjoxNzMwNDI5NTk3fQ.mSY7GMfEohf3KBHuE7-aoL97CIRWA6FkBdTMD3ibbAM",
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        print("Data berhasil dikirim: ${response.body}");
      } else {
        print("Gagal mengirim data: ${response.statusCode}");
        print(
            "Pesan error: ${response.body}"); // Menampilkan pesan error dari server
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  // Fungsi untuk menambahkan data TPS ke dalam `tpsData`
  void addTPSData(String votingSite, String location, Map<String, String> suara) {
    setState(() {
      tpsData.add({
        "votingSite": votingSite,
        "location": location,
        "metadata": suara.entries.map((e) {
          return {"key": e.key, "value": e.value};
        }).toList(),
      });
    });
  }

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
                    onPressed: () async {
                      await sendDataToApi(); // Mengirim data TPS ke API
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: primaryColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 5),
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
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            tpsData.clear(); // Hapus semua data TPS
                            tpsContainers.clear(); // Hapus semua kontainer TPS
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
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
    final votingSiteController = TextEditingController();
    final locationController = TextEditingController();
    final suaraControllers = [
      TextEditingController(), // Kandidat 1
      TextEditingController(), // Kandidat 2
      TextEditingController(), // Suara Tidak Sah
      TextEditingController(), // Total DPT
    ];

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: secondaryColor,
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
            _buildTextField('Nama TPS', votingSiteController, isDarkMode),
            _buildTextField('Lokasi TPS', locationController, isDarkMode),
            _buildTextField(
                'Suara Kandidat 1', suaraControllers[0], isDarkMode),
            _buildTextField(
                'Suara Kandidat 2', suaraControllers[1], isDarkMode),
            _buildTextField('Suara Tidak Sah', suaraControllers[2], isDarkMode),
            _buildTextField('Total DPT', suaraControllers[3], isDarkMode),
            ElevatedButton(
              onPressed: () {
                final suara = {
                  "suara_1": suaraControllers[0].text,
                  "suara_2": suaraControllers[1].text,
                  "suara_tidak_sah": suaraControllers[2].text,
                  "total_dpt": suaraControllers[3].text,
                };

                addTPSData(votingSiteController.text, locationController.text, suara);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: primaryColor,
              ),
              child: Text('Simpan TPS'),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk TextField yang digunakan pada Formulir
  Widget _buildTextField(
      String labelText, TextEditingController controller, bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 45,
          child: TextField(
            controller: controller,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: primaryColor, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white54, width: 1.0),
              ),
              filled: true,
              fillColor: secondaryColor,
            ),
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
