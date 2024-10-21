import 'package:flutter/material.dart';
import 'package:projek1/colors.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:projek1/laut.dart';
import 'package:projek1/notif.dart';
import 'package:projek1/personil.dart';
import 'sosial.dart';
import 'demografis.dart';
import 'geografis.dart';
import 'lingkungan.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedValue = 'Kodam III/Siliwangi'; // Nilai default dropdown

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context);
    final isDarkMode = theme.mode.isDark;

    var data = [
      ChartData('Tam', 3000),
      ChartData('Bin', 900),
      ChartData('Per', 200),
    ];
    var data2 = [
      ChartData2('Angkatan Laut', 40, const Color.fromARGB(255, 39, 65, 40)),
      ChartData2('Marinir', 30, Colors.green),
      ChartData2('Kapal Selam', 15, Color.fromARGB(255, 160, 229, 170)),
      ChartData2('Helikopter', 15, Color.fromARGB(255, 80, 121, 54)),
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 120, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20), // Tambahan jarak untuk margin atas
                // Logo dan ikon notifikasi
                Row(
                  children: [
                    Image.asset(
                      'assets/images/logoo.png', // Ganti dengan path gambar yang sesuai
                      width: 35,
                      height: 35,
                      fit: BoxFit.cover,
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.notifications_none_sharp,
                          size: 25,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Notif()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20), // Jarak antara gambar dan dropdown

                // Dropdown
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 27),
                  decoration: BoxDecoration(
                    color: primaryColor, // Background color untuk dropdown
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedValue,
                      items: <String>['Kodam III/Siliwangi', 'kodam IV/Diponegoro', 'Kodam V/Brawijaya','Kodam XVII/Cenderawasih']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                color: Colors.white), // Warna teks item
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedValue = newValue!;
                        });
                      },
                      hint: Text(
                        "Pilih opsi",
                        style:
                            TextStyle(color: Colors.white), // Warna teks hint
                      ),
                      dropdownColor: secondaryColor,
                      icon: Icon(Icons.keyboard_arrow_down_rounded,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Container besar dan 3 container kecil di sebelahnya
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigasi ke halaman baru
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PersonilAktif()),
                        );
                      },
                      child: Container(
                        width: 172,
                        height: 250,
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
                          padding: const EdgeInsets.all(9),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Posisikan chart di tengah
                            children: [
                              Text(
                                'Personil Aktif',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                  height:
                                      10), // Memberikan jarak antara teks dan chart
                              Expanded(
                                child: SfCartesianChart(
                                  primaryXAxis: CategoryAxis(),
                                  series: <ChartSeries>[
                                    ColumnSeries<ChartData, String>(
                                      dataSource: data,
                                      xValueMapper: (ChartData data, _) =>
                                          data.month,
                                      yValueMapper: (ChartData data, _) =>
                                          data.value,
                                      color: primaryColor,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                        width: 25), // Jarak antara container besar dan kecil

                    // Deretan 3 container kecil dengan label di kiri
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pasukan",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Kavaleri",
                            style: TextStyle(fontSize: 12, color: Colors.white70),
                          ),
                          SizedBox(height: 10),
                          // Container kecil 1
                          _buildSmallContainer('2000'),
                          SizedBox(height: 10),
                          Text(
                            "Infanteri",
                            style: TextStyle(fontSize: 12, color: Colors.white70),
                          ),
                          SizedBox(height: 10),
                          _buildSmallContainer('750'),
                          SizedBox(height: 10),
                          Text(
                            "Artileri",
                            style: TextStyle(fontSize: 12, color: Colors.white70),
                          ),
                          SizedBox(height: 10),
                          _buildSmallContainer('100'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Row kedua
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                KekuatanLaut(), // Ganti dengan halaman tujuan
                          ),
                        );
                      },
                      child: Container(
                        width: 172,
                        height: 210,
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
                          padding: const EdgeInsets.all(9),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Kekuatan Laut',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10),
                              Expanded(
                                child: SfCircularChart(
                                  series: <CircularSeries>[
                                    DoughnutSeries<ChartData2, String>(
                                      dataSource: data2,
                                      xValueMapper: (ChartData2 data, _) =>
                                          data.category,
                                      yValueMapper: (ChartData2 data, _) =>
                                          data.value,
                                      pointColorMapper: (ChartData2 data, _) =>
                                          data.color,
                                      dataLabelSettings:
                                          DataLabelSettings(isVisible: true),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SosialEkonomi()), // Halaman tujuan
                            );
                          },
                          child: _buildSmallContainer('Sosial Ekonomi'),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Demografis()), // Halaman tujuan
                            );
                          },
                          child: _buildSmallContainer('Demografis'),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Geografis()), // Halaman tujuan
                            );
                          },
                          child: _buildSmallContainer('Geografis'),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Lingkungan()), // Halaman tujuan
                            );
                          },
                          child: _buildSmallContainer('Lingkungan'),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
// Menambahkan peta
                Container(
                  width: double.infinity,
                  height: 250, // Tinggi persegi peta
                  decoration: BoxDecoration(
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FlutterMap(
                      options: MapOptions(
                        center:
                            LatLng(-4.269928, 138.080353), // Koordinat Papua
                        zoom: 5.0, // Zoom level yang sesuai untuk Papua
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: ['a', 'b', 'c'],
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              width: 80.0,
                              height: 80.0,
                              point: LatLng(-3.91828, 137.72079), // Koordinat Jayapura
                              builder: (ctx) => Icon(
                                Icons.location_on,
                                color: secondaryColor,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
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

  Widget _buildSmallContainer(String label) {
    return Container(
      width: 120,
      height: 40,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final String month;
  final double value;

  ChartData(this.month, this.value);
}

class ChartData2 {
  final String category;
  final double value;
  final Color color;

  ChartData2(this.category, this.value, this.color);
}
