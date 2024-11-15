import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:projek1/colors.dart';
import 'package:projek1/navbar/quick.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class Pilkada extends StatefulWidget {
  final int id;

  const Pilkada({Key? key, required this.id}) : super(key: key);

  @override
  _PilkadaState createState() => _PilkadaState();
}

class _PilkadaState extends State<Pilkada> {
  List<dynamic> quickCountData = [];
  DateTime endDate = DateTime(2024, 12, 26); // Sesuaikan tanggal akhir
  bool isLoading = true;
  bool isLoadingHeader = true;

  @override
  void initState() {
    super.initState();
    fetchQuickCountData(widget.id);
  }

  Future<void> fetchQuickCountData(int id) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final response = await http.get(
      Uri.parse(
          'https://tera-tni-api.onrender.com/v1/quick-counts/selections/selection-descendants/by-period/$id'),
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
  }

  Future<void> saveLastClickedTime() async {
    final prefs = await SharedPreferences.getInstance();
    final currentTime = DateTime.now().toIso8601String();
    await prefs.setString('lastClickedTime', currentTime);
  }

  Future<String?> getLastClickedTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('lastClickedTime');
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
        title: Text("Pengumpulan Hitung Cepat",
            style: TextStyle(color: Colors.white)),
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
                        "tersisa pengumpulan hitung cepat",
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            "Pengumpulan Hitung Cepat",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: quickCountData.length,
                            itemBuilder: (context, index) {
                              final item = quickCountData[index];
                              final candidateName =
                                  item['name'] ?? "Nama tidak tersedia";
                              final candidateCount = quickCountData.length;
                              final timestamp = item['timestamp'] ?? "Waktu tidak tersedia";

                              return FutureBuilder<String?>(
                                future: getLastClickedTime(),
                                builder: (context, snapshot) {
                                  String lastClickedTime = snapshot.data ?? "Belum pernah di-klik";
                                  if (snapshot.connectionState == ConnectionState.done &&
                                      snapshot.hasData) {
                                    lastClickedTime = DateFormat("yyyy-MM-dd HH:mm")
                                        .format(DateTime.parse(snapshot.data!));
                                  }

                                  return Card(
                                    color: Colors.grey[900],
                                    margin: EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 10,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: ListTile(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 10),
                                      title: Text(
                                        candidateName,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 4),
                                          Text(
                                            "$candidateCount Kandidat",
                                            style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Text(
                                                "Terakhir diperbarui: ",
                                                style: TextStyle(
                                                  color: Colors.grey[400],
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                "$lastClickedTime",
                                                style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.grey[500],
                                        size: 18,
                                      ),
                                      onTap: () async {
                                        await saveLastClickedTime();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => QuickCount(
                                              id: item["id"],
                                              title: item["name"] ??
                                                  "Pengumpulan Hitung Cepat",
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
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
