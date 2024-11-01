import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:projek1/colors.dart';
import 'package:projek1/navbar/quick.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pilkada extends StatefulWidget {
  final int id; // Tambahkan parameter id

  const Pilkada({Key? key, required this.id}) : super(key: key);

  @override
  _PilkadaState createState() => _PilkadaState();
}

class _PilkadaState extends State<Pilkada> {
  List<dynamic> quickCountData = [];
  
  DateTime endDate = DateTime(2024, 12, 26); // Adjust according to your end date
  bool isLoading = true;
  bool isLoadingHeader = true;

  @override
  void initState() {
    super.initState();
    fetchQuickCountData(widget.id); // Call API with the id received
  }

  Future<void> fetchQuickCountData(int id) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('https://tera-tni-api.onrender.com/v1/quick-counts/selections/selection-descendants/by-period/$id'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    final response1 = await http.get(
      Uri.parse('https://tera-tni-api.onrender.com/v1/quick-counts/periods/$id'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

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
    if (response1.statusCode == 200) {
      setState(() {
        final Map<String, dynamic> data = json.decode(response1.body);
        print(data);
      });
    } else {
      setState(() {
        isLoadingHeader = false;
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
        title: Text("Pengumpulan Hitung Cepat", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: backgroundColor,
      ),
      backgroundColor: backgroundColor,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
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
                        "tersisa",
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
                              return Card(
                                color: Colors.grey[900],
                                child: ListTile(
                                  title: Text(
                                    item['name'] ?? "Nama tidak tersedia",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    "Status: ${item['status']}",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  onTap: () {
                                    // Navigate to a new page with item id
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => QuickCount(),
                                      ),
                                    );
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
    );
  }
}