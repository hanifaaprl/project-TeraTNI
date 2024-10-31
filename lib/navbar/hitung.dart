import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:projek1/colors.dart';

class HitungCepatPage extends StatefulWidget {
  @override
  _HitungCepatPageState createState() => _HitungCepatPageState();
}

class _HitungCepatPageState extends State<HitungCepatPage> {
  List<dynamic> dataPemilu = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('https://tera-tni-api.onrender.com/v1/quick-counts/periods'),
        headers: {
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InNvcmVhbmciLCJzdWIiOjYsImlhdCI6MTczMDM1Mzk4MywiZXhwIjoxNzMwNDQwMzgzfQ.raFQOxX8y4Ne7S67cLJz01-LNXXJh_JYeqxRp5qmWEo', // Ganti dengan token yang benar jika diperlukan
        },
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        setState(() {
          dataPemilu = data['data'];
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Hitung Cepat", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Periode Pemilihan Umum",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(height: 16),
            isLoading
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      itemCount: dataPemilu.length,
                      itemBuilder: (context, index) {
                        final item = dataPemilu[index];
                        return Card(
                          color: Colors.grey[900],
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item["name"] ?? "Nama tidak tersedia",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(Icons.calendar_today, color: Colors.white),
                                    SizedBox(width: 8),
                                    Text(
                                      "${formatDate(item["beginDate"])} - ${formatDate(item["endDate"])}",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: item["periodStatus"] == "ongoing" ? Colors.green : Colors.grey,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    item["periodStatus"] == "ongoing" ? "Sedang berlangsung" : "Selesai",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  String formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return "${dateTime.day} ${_convertMonth(dateTime.month)} ${dateTime.year}";
  }

  String _convertMonth(int month) {
    const months = [
      "Jan", "Feb", "Mar", "Apr", "Mei", "Jun", "Jul", "Agu", "Sep", "Okt", "Nov", "Des"
    ];
    return months[month - 1];
  }
}
