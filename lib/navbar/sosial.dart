import 'package:flutter/material.dart';
import 'package:projek1/colors.dart';
import 'package:projek1/navbar/hitung.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'formsos.dart';
import 'editsos.dart';
//import 'package:adaptive_theme/adaptive_theme.dart';

class SosialEkonomi extends StatefulWidget {
  @override
  _SosialEkonomiState createState() => _SosialEkonomiState();
}

class _SosialEkonomiState extends State<SosialEkonomi> {
  String? selectedValue;
  List<String> dropdownItems = ['Papua Barat', 'Papua Tengah', 'Papua Selatan'];

  @override
  Widget build(BuildContext context) {
    // final theme = AdaptiveTheme.of(context);
    // final isDarkMode = theme.mode.isDark;

    final List<ChartData> data1 = [
      ChartData('Jan', 35),
      ChartData('Feb', 40),
      ChartData('Mar', 55),
      ChartData('Apr', 50),
      ChartData('May', 60),
      ChartData('Jun', 55),
    ];

    final List<ChartData> data2 = [
      ChartData('Jan', 20),
      ChartData('Feb', 30),
      ChartData('Mar', 25),
      ChartData('Apr', 35),
      ChartData('May', 32),
      ChartData('Jun', 20),
    ];
    final List<ChartData2> data = [
      ChartData2('Q1', 30),
      ChartData2('Q2', 50),
      ChartData2('Q3', 40),
      ChartData2('Q4', 70),
    ];
    return Scaffold(
      //backgroundColor: isDarkMode ? Colors.black : Colors.white,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Header
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  //color: isDarkMode ? Colors.black : Colors.white,
                  color: backgroundColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 24,
                          color: Colors.white,
                          //color: isDarkMode ? Colors.white : Colors.black87,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(width: 20),
                      Text(
                        'Sosial Ekonomi',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          //color: isDarkMode ? Colors.white : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),

                // Konten utama di dalam SingleChildScrollView
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Dropdown dan TextField
                        Row(
                          children: [
                            // Dropdown di kiri
                            Container(
                              width: 145,
                              height: 30,
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(12),
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
                                  value: selectedValue,
                                  dropdownColor: secondaryColor,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Colors.white,
                                  ),
                                  hint: Text(
                                    "Papua",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  style: TextStyle(color: Colors.white),
                                  items: dropdownItems.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedValue = newValue;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(width: 10),

                            // TextField di kanan
                            Expanded(
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Cari ...",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 12),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),

                        // Baris untuk item "Partai Politik Dominan"
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => KekuatanLaut(),
                                //   ),
                                // );
                              },
                              child: Container(
                                width: 179,
                                height: 230,
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
                                    children: [
                                      Text(
                                        'Partai Politik Dominan',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                          height:
                                              10), // Memberikan jarak antara teks dan grafik
                                      Expanded(
                                        child: SfCartesianChart(
                                          primaryXAxis: CategoryAxis(),
                                          primaryYAxis: NumericAxis(),
                                          series: <ChartSeries>[
                                            AreaSeries<ChartData, String>(
                                              name: 'Partai A',
                                              dataSource: data1,
                                              xValueMapper:
                                                  (ChartData sales, _) =>
                                                      sales.year,
                                              yValueMapper:
                                                  (ChartData sales, _) =>
                                                      sales.value,
                                              color: Colors.blueGrey.withOpacity(
                                                  0.5), // Warna area Partai A
                                              borderColor: Colors
                                                  .blueGrey, // Warna batas area Partai A
                                              borderWidth: 2,
                                            ),
                                            AreaSeries<ChartData, String>(
                                              name: 'Partai B',
                                              dataSource: data2,
                                              xValueMapper:
                                                  (ChartData sales, _) =>
                                                      sales.year,
                                              yValueMapper:
                                                  (ChartData sales, _) =>
                                                      sales.value,
                                              color: primaryColor.withOpacity(
                                                  0.5), // Warna area Partai A
                                              borderColor:
                                                  secondaryColor, // Warna batas area Partai A
                                              borderWidth: 2,
                                            ),
                                          ],
                                          tooltipBehavior:
                                              TooltipBehavior(enable: true),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 25),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      "Umum",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Partai Politik",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white70),
                                  ),
                                  SizedBox(height: 10),
                                  _buildSmallContainer('2'),
                                  SizedBox(height: 10),
                                  Text(
                                    "Pasar",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white70),
                                  ),
                                  SizedBox(height: 10),
                                  _buildSmallContainer('50'),
                                  SizedBox(height: 10),
                                  Text(
                                    "Mall",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white70),
                                  ),
                                  SizedBox(height: 10),
                                  _buildSmallContainer('5'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HitungCepatPage()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: primaryColor,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 120, vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Quick Count ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Center(
                          child: Container(
                            width: 250,
                            height: 300,
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
                              padding: const EdgeInsets.all(9.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Perkembangan Ekonomi',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                      height:
                                          10), // Jarak antara judul dan grafik
                                  Expanded(
                                    child: SfCartesianChart(
                                      primaryXAxis: CategoryAxis(),
                                      title: ChartTitle(text: 'Tahun'),
                                      series: <ChartSeries>[
                                        ColumnSeries<ChartData, String>(
                                          dataSource: [
                                            ChartData('2021', 50),
                                            ChartData('2022', 70),
                                            ChartData('2023', 90),
                                            ChartData('2024', 80),
                                          ],
                                          xValueMapper: (ChartData data, _) =>
                                              data.year,
                                          yValueMapper: (ChartData data, _) =>
                                              data.value,
                                          color: Color.fromARGB(255, 90, 133, 110), // Ganti warna sesuai kebutuhan
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: Container(
                            width: 250,
                            height: 300,
                            decoration: BoxDecoration(
                              color:
                                  secondaryColor, // Sesuaikan dengan primaryColor kamu
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Text(
                                    'Penduduk',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),

                                // Radial Bar Chart (Berdasarkan Usia Penduduk)
                                Expanded(
                                  child: SfCircularChart(
                                    legend: Legend(
                                      isVisible: true,
                                      textStyle: TextStyle(color: Colors.white),
                                    ),
                                    series: <CircularSeries>[
                                      RadialBarSeries<ChartData3, String>(
                                        dataSource: getUsiaChartData(),
                                        xValueMapper: (ChartData3 data, _) =>
                                            data.label,
                                        yValueMapper: (ChartData3 data, _) =>
                                            data.value,
                                        dataLabelSettings:
                                            DataLabelSettings(isVisible: true),
                                        // Besarkan radius dan innerRadius untuk bar chart ini
                                        radius: '90%',
                                        innerRadius: '10%',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Tambahkan tombol di pojok kanan bawah menggunakan Container dengan IconButton
            Positioned(
              bottom: 30,
              right: 20,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add, color: Colors.white, size: 30),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FormSosialEkonomi(), // Halaman untuk menambah data
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.edit, color: Colors.white, size: 30),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EditSosialEkonomi(), // Halaman untuk mengedit data
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun container kecil
  Widget _buildSmallContainer(String label) {
    return Container(
      width: 120,
      height: 35,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
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
  final String year;
  final double value;

  ChartData(this.year, this.value);
}

class ChartData2 {
  final String quarter;
  final double value;

  ChartData2(this.quarter, this.value);
}

// Data untuk Radial Bar Chart (berdasarkan usia penduduk)
List<ChartData3> getUsiaChartData() {
  return [
    ChartData3('Tidak Terdaftar', 25),
    ChartData3('Terdaftar', 60),
  ];
}

// Model data untuk chart
class ChartData3 {
  ChartData3(this.label, this.value);
  final String label;
  final double value;
}
