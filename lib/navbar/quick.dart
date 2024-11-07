import 'dart:convert';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:projek1/colors.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class QuickCount extends StatefulWidget {
  final int id;

  const QuickCount({Key? key, required this.id}) : super(key: key);

  @override
  _QuickCountState createState() => _QuickCountState();
}

class _QuickCountState extends State<QuickCount> {
  List<Map<String, dynamic>> tpsData = [];
  List<Widget> tpsContainers = [];
  List<Map<String, dynamic>> candidates = [];

  Future<void> fetchCandidates(int id) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final url = Uri.parse(
        'https://tera-tni-api.onrender.com/v1/quick-counts/selections/$id');

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        setState(() {
          candidates = List<Map<String, dynamic>>.from(
              responseData['data']['candidates']);
        });
      } else {
        print("Gagal mengambil data kandidat: ${response.statusCode}");
        print("Pesan error: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> sendDataToApi(int id) async {
  final prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  if (token == null) {
    print("Token tidak ditemukan di SharedPreferences");
    return; 
  }

  final url = Uri.parse('https://tera-tni-api.onrender.com/v1/quick-counts/transactions/$id');

  final requestBody = {
    "selectionId": id,
    "transactio ns": tpsData,
  };

  print("URL: $url");
  print("Token: $token");
  print("Request Body: $requestBody");

  try {
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );

    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      print("Data berhasil dikirim: ${response.body}");
    } else {
      print("Gagal mengirim data: ${response.statusCode}");
      print("Pesan error: ${response.body}");
    }
  } catch (e) {
    print("Error: $e");
  }
  }

  void addTPSData(String votingSite, String location, Map<String, String> suara,
      String invalidcount, String abstention) {
    setState(() {
      tpsData.add({
        "votingSite": votingSite,
        "location": location,
        "metadata": [
          ...suara.entries
              .map((e) => {"key": "candidate:${e.key}", "value": e.value}),
          {"key": "invalidcount", "value": invalidcount},
          {"key": "abstention", "value": abstention},
        ],
      });
    });
    sendDataToApi(widget.id);
  }

  @override
  void initState() {
    super.initState();
    fetchCandidates(widget.id); // Menggunakan widget.id di sini
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
                      await sendDataToApi(
                          widget.id); // Menggunakan widget.id di sini
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
                _buildTPSContainer(isDarkMode),
                Column(
                  children: tpsContainers,
                ),
                SizedBox(height: 20),
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
                            tpsData.clear();
                            tpsContainers.clear();
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

  Widget _buildTPSContainer(bool isDarkMode) {
    final votingSiteController = TextEditingController();
    final locationController = TextEditingController();
    final suaraTidakSahController = TextEditingController();
    final totalDPTController = TextEditingController();
    final suaraControllers = List<TextEditingController>.generate(
      candidates.length,
      (index) => TextEditingController(),
    );

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
            for (int i = 0; i < candidates.length; i++)
              _buildTextField(
                  'Suara Kandidat ${candidates[i]['candidateName']}',
                  suaraControllers[i],
                  isDarkMode),
            _buildTextField(
                'Suara Tidak Sah', suaraTidakSahController, isDarkMode),
            _buildTextField('Total DPT', totalDPTController, isDarkMode),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

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
            keyboardType: TextInputType.number,
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
      ],
    );
  }
}
