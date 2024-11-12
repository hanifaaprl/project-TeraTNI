import 'dart:convert';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:projek1/colors.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class QuickCount extends StatefulWidget {
  final int id;
  final String title;

  const QuickCount({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  _QuickCountState createState() => _QuickCountState();
}

class _QuickCountState extends State<QuickCount> {
  List<Map<String, dynamic>> tpsData = [];
  List<Map<String, dynamic>> candidates = [];
  List<Widget> tpsContainers = [];

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    print("Token berhasil disimpan");
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> fetchCandidates(int id) async {
    String? token = await getToken();
    if (token == null) {
      print("Token tidak ditemukan, silakan login kembali");
      return;
    }

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
    final token = await getToken();
    if (token == null) {
      print("Token tidak ditemukan di SharedPreferences");
      return;
    }

    final url = Uri.parse(
        'https://tera-tni-api.onrender.com/v1/quick-counts/transactions');
    final requestBody = {
      "selectionId": id,
      "transactions": tpsData,
    };

    print("URL: $url");
    print("Token: $token");
    print(
        "Request Body (JSON): ${jsonEncode(requestBody)}"); // menampilkan JSON yang akan dikirim

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

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Data berhasil dikirim: ${response.body}");
      } else {
        print("Gagal mengirim data: ${response.statusCode}");
        print("Pesan error: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  void addTPSData(String votingSite, String location, Map<String, String> suara,
      String invalidcount, String abstention) {
    setState(() {
      tpsData.add({
        "votingSite": votingSite,
        "location": location,
        "metadata": [
          ...suara.entries.map((e) {
            return {"key": "candidate:${e.key}", "value": e.value};
          }).toList(),
          {"key": "invalid-count", "value": invalidcount}, 
          {"key": "abstention", "value": abstention}, 
        ],
      });

      print("tpsData yang akan dikirim: ${jsonEncode(tpsData)}");
    });

    sendDataToApi(widget.id);
  }

  @override
  void initState() {
    super.initState();
    fetchCandidates(widget.id);
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
                          "Pengumpulan Hitung Cepat",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          widget.title,
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
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final Map<String, String> suara = {
                    for (int i = 0; i < candidates.length; i++)
                      candidates[i]['id'].toString():
                          suaraControllers[i].text.isEmpty
                              ? '0'
                              : suaraControllers[i].text
                  };

                  final String invalidcount =
                      suaraTidakSahController.text.isEmpty
                          ? '0'
                          : suaraTidakSahController.text;
                  final String abstention = totalDPTController.text.isEmpty
                      ? '0'
                      : totalDPTController.text;

                  addTPSData(
                    votingSiteController.text,
                    locationController.text,
                    suara,
                    invalidcount,
                    abstention,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Tambah TPS',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey[500]),
          filled: true,
          fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
