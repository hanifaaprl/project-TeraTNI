import 'package:projek1/navbar/editdem.dart';
import 'package:projek1/navbar/formdem.dart';
import 'package:syncfusion_flutter_charts/charts.dart'; // Pastikan ini sudah terimport
import 'package:flutter/material.dart';
import 'package:projek1/colors.dart';

class Demografis extends StatefulWidget {
  @override
  _DemografisState createState() => _DemografisState();
}

class _DemografisState extends State<Demografis> {
  String? selectedValue; // Variable for storing the selected value
  List<String> dropdownItems = [
    'Papua',
    'Jawa Barat',
    'Jawa Timur'
  ]; // Dropdown items

  // Data untuk chart
  List<ChartData> chartData = [
    ChartData('Remaja', 40, Color.fromARGB(255, 51, 85, 69)),
    ChartData('Partai B', 30, Color.fromARGB(255, 84, 146, 103)),
    ChartData('Partai C', 20, Colors.green),
    ChartData('Partai D', 10, Color.fromARGB(255, 127, 220, 128)),
  ];

  List<ChartData2> chartData2 = [
    ChartData2('2020', 50, 20),
    ChartData2('2021', 55, 25),
    ChartData2('2022', 60, 30),
    ChartData2('2023', 65, 35),
  ];

  // Data untuk grafik jenis pekerjaan
  List<ChartData> chartData3 = [
    ChartData('Petani', 35, Colors.blue),
    ChartData('Pengusaha', 25, Colors.green),
    ChartData('PNS', 20, Colors.orange),
    ChartData('Pedagang', 15, Colors.purple),
    ChartData('Lain-lain', 5, Colors.red),
  ];

  List<ChartData> chartDataGender = [
    ChartData('Laki-laki', 55, Colors.blue),
    ChartData('Perempuan', 45, Colors.pink),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Header
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  color: backgroundColor,
                  child: Row(
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
                      Text(
                        'Demografis',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
                              width: 130,
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
                                    color: Colors.black,
                                  ),
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ),
                                    hintText: "Cari ...",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 4, horizontal: 12),
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

                        // Baris untuk item "Distribusi Umur"
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Aksi ketika grafik ditekan
                              },
                              child: Container(
                                width: 190,
                                height: 200,
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
                                        'Distribusi Umur',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 10),
                                      Expanded(
                                        child: SfCircularChart(
                                          legend: Legend(
                                            isVisible: true,
                                            position: LegendPosition.bottom,
                                          ),
                                          series: <CircularSeries>[
                                            DoughnutSeries<ChartData, String>(
                                              dataSource: chartData,
                                              xValueMapper:
                                                  (ChartData data, _) =>
                                                      data.category,
                                              yValueMapper:
                                                  (ChartData data, _) =>
                                                      data.value,
                                              pointColorMapper:
                                                  (ChartData data, _) =>
                                                      data.color,
                                              innerRadius: '60%',
                                            )
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
                                    "Jumlah Populasi",
                                    style: TextStyle(fontSize: 12, color: Colors.white70),
                                  ),
                                  SizedBox(height: 10),
                                  _buildSmallContainer('3.000.000'),
                                  SizedBox(height: 10),
                                  Text(
                                    "Agama",
                                    style: TextStyle(fontSize: 12, color: Colors.white70),
                                  ),
                                  SizedBox(height: 10),
                                  _buildSmallContainer('5'),
                                  SizedBox(height: 10),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 20),

                        // Container baru untuk grafik kelahiran dan kematian
                        Container(
                          padding: EdgeInsets.all(10),
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
                          child: Column(
                            children: [
                              Text(
                                'Grafik Kelahiran dan Kematian',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10),
                              SfCartesianChart(
                                primaryXAxis: CategoryAxis(),
                                legend: Legend(isVisible: true),
                                series: <ChartSeries>[
                                  ColumnSeries<ChartData2, String>(
                                    name: 'Kelahiran',
                                    dataSource: chartData2,
                                    xValueMapper: (ChartData2 data, _) =>
                                        data.year,
                                    yValueMapper: (ChartData2 data, _) =>
                                        data.births,
                                    color: Colors.green,
                                  ),
                                  ColumnSeries<ChartData2, String>(
                                    name: 'Kematian',
                                    dataSource: chartData2,
                                    xValueMapper: (ChartData2 data, _) =>
                                        data.year,
                                    yValueMapper: (ChartData2 data, _) =>
                                        data.deaths,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Aksi ketika tombol ditekan
                                  print("Tombol Details ditekan");
                                  // Bisa digunakan untuk navigasi ke halaman lain atau menampilkan detail tambahan
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor, // Warna tombol
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        12), // Membuat tombol lebih melengkung
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Text(
                                    'Details',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        // Container baru untuk grafik jenis pekerjaan menggunakan DoughnutChart
                        Container(
                          padding: EdgeInsets.all(10),
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
                          child: Column(
                            children: [
                              Text(
                                'Distribusi Jenis Pekerjaan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10),
                              SfCircularChart(
                                legend: Legend(
                                  isVisible: true,
                                  position: LegendPosition.bottom,
                                ),
                                series: <CircularSeries>[
                                  DoughnutSeries<ChartData, String>(
                                    dataSource:
                                        chartData3, // Data untuk grafik donat
                                    xValueMapper: (ChartData data, _) =>
                                        data.category,
                                    yValueMapper: (ChartData data, _) =>
                                        data.value,
                                    pointColorMapper: (ChartData data, _) =>
                                        data.color,
                                    innerRadius:
                                        '60%', // Membuat grafik menjadi donat
                                  )
                                ],
                                tooltipBehavior: TooltipBehavior(enable: true),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        // Container baru untuk grafik jenis kelamin menggunakan DoughnutChart
                        Container(
                          padding: EdgeInsets.all(10),
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
                          child: Column(
                            children: [
                              Text(
                                'Distribusi Jenis Kelamin',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10),
                              SfCircularChart(
                                legend: Legend(
                                  isVisible: true,
                                  position: LegendPosition.bottom,
                                ),
                                series: <CircularSeries>[
                                  DoughnutSeries<ChartData, String>(
                                    dataSource:
                                        chartDataGender, // Data untuk grafik jenis kelamin
                                    xValueMapper: (ChartData data, _) =>
                                        data.category,
                                    yValueMapper: (ChartData data, _) =>
                                        data.value,
                                    pointColorMapper: (ChartData data, _) =>
                                        data.color,
                                    innerRadius:
                                        '60%', // Membuat grafik menjadi donat
                                  )
                                ],
                                tooltipBehavior: TooltipBehavior(enable: true),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
                                FormDemografis(), // Halaman untuk menambah data
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
                                EditDemografis(), // Halaman untuk mengedit data
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

  Widget _buildSmallContainer(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: 120,
      height: 35,
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

// Kelas untuk data chart
class ChartData {
  ChartData(this.category, this.value, this.color);
  final String category;
  final double value;
  final Color color;
}

class ChartData2 {
  ChartData2(this.year, this.births, this.deaths);
  final String year;
  final double births;
  final double deaths;
}
