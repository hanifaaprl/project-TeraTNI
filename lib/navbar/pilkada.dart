import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class Pilkada extends StatefulWidget {
  @override
  _PilkadaState createState() => _PilkadaState();
}

class _PilkadaState extends State<Pilkada> {
  List<dynamic> quickCountData = [];
  DateTime endDate = DateTime(2024, 12, 26); // Sesuaikan dengan tanggal akhir periode
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchQuickCountData();
  }

  Future<void> fetchQuickCountData() async {
    final url = 'https://tera-tni-api.onrender.com/v1/quick-counts/periods/3';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        quickCountData = json.decode(response.body)['data'];
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  String getDaysRemaining() {
    final now = DateTime.now();
    final difference = endDate.difference(now).inDays;
    return difference.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pengumpulan Hitung Cepat"),
        backgroundColor: Colors.black,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Bagian Status dan Hitung Mundur
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sedang berlangsung",
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "${getDaysRemaining()} hari",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "tersisa untuk Testing 2024",
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("2 Okt", style: TextStyle(color: Colors.grey)),
                          Text("26 Des", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
                // Bagian Pengumpulan Hitung Cepat
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pengumpulan Hitung Cepat",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: ListView.builder(
                            itemCount: quickCountData.length,
                            itemBuilder: (context, index) {
                              final item = quickCountData[index];
                              final lastUpdated = DateFormat("dd MMM yyyy HH:mm")
                                  .format(DateTime.parse(item['lastUpdated'] ?? DateTime.now().toString()));

                              return Card(
                                color: Colors.grey[900],
                                margin: EdgeInsets.only(bottom: 10),
                                child: ListTile(
                                  title: Text(
                                    item['title'] ?? '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${item['candidates']} kandidat",
                                        style: TextStyle(color: Colors.grey[400]),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Terakhir diperbarui: $lastUpdated",
                                        style: TextStyle(
                                          color: index == 0
                                              ? Colors.orangeAccent
                                              : Colors.greenAccent,
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: Icon(Icons.arrow_forward, color: Colors.grey),
                                  onTap: () {
                                    // Aksi ketika card diklik
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
      backgroundColor: Colors.black,
    );
  }
}
