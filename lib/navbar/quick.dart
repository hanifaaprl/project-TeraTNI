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
      String invalidcount, String totalDPT, String totalelectoral) {
    int validCount = suara.values
        .map((value) => int.tryParse(value) ?? 0)
        .reduce((a, b) => a + b);

    int totalDPTValue = int.tryParse(totalDPT) ?? 0;
    int invalidCountValue = int.tryParse(invalidcount) ?? 0;
    int abstentionCount = totalDPTValue - (validCount + invalidCountValue);

    setState(() {
      tpsData.add({
        "votingSite": votingSite,
        "location": location,
        "metadata": [
          ...suara.entries.map((e) {
            return {"key": "candidate:${e.key}", "value": e.value};
          }).toList(),
          {"key": "invalid-count", "value": invalidcount},
          {"key": "abstention", "value": totalDPT},
          {"key": "total-electoral-register", "value": totalelectoral},
          {"key": "valid-count", "value": validCount.toString()},
          {"key": "abstention-count", "value": abstentionCount.toString()},
        ],
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCandidates(widget.id).then((_) {
      // Menambahkan satu container TPS setelah candidates berhasil diambil
      setState(() {
        tpsContainers.add(_buildTPSContainer());
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
                Center(
                  child: Container(
                    width: 200, // Mengatur lebar tombol agar memenuhi ruang
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            40), // Mengatur padding horizontal untuk panjang tombol
                    child: ElevatedButton(
                      onPressed: () {
                        sendDataToApi(widget.id);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Menjaga ikon dan teks di tengah
                        children: [
                          Icon(
                            Icons.send, // Ikon send
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10), // Jarak antara icon dan text
                          Text(
                            'Send',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: tpsContainers,
                ),
                SizedBox(height: 20),
                // Button untuk menambah TPS baru
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        tpsContainers.add(_buildTPSContainer());
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: primaryColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 110, vertical: 5),
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
        ),
      ),
    );
  }

  Widget _buildTPSContainer() {
    final votingSiteController = TextEditingController();
    final locationController = TextEditingController();
    final suaraTidakSahController = TextEditingController();
    final totalDPTController = TextEditingController();
    final totalelectoralController = TextEditingController();
    final suaraControllers = List<TextEditingController>.generate(
      candidates.length,
      (index) => TextEditingController(),
    );

    // Buat ID unik untuk setiap TPS Container
    final String tpsId = UniqueKey().toString();

    return Container(
      key: Key(tpsId), // Gunakan ID unik untuk container
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
            _buildTextField('Nama TPS', votingSiteController),
            _buildTextField('Lokasi TPS', locationController),
            for (int i = 0; i < candidates.length; i++)
              _buildTextField(
                'Suara Kandidat ${candidates[i]['candidateName']}',
                suaraControllers[i],
              ),
            _buildTextField('Suara Tidak Sah', suaraTidakSahController),
            _buildTextField('Total DPT', totalDPTController),
            _buildTextField('Total Electoral', totalelectoralController),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    // Hapus TPSContainer berdasarkan Key yang telah di-set
                    tpsContainers.removeWhere(
                      (container) => container.key == Key(tpsId),
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: label,
            hintStyle: TextStyle(color: Colors.grey),
            filled: true,
            fillColor: secondaryColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
