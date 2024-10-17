import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; // Import latlong2
import 'package:projek1/colors.dart';
import 'package:projek1/navbar/editling.dart';
import 'package:projek1/navbar/formling.dart';

class Lingkungan extends StatefulWidget {
  @override
  _LingkunganState createState() => _LingkunganState();
}

class _LingkunganState extends State<Lingkungan> {
  String? selectedValue;
  List<String> dropdownItems = ['Papua Barat', 'Papua Tengah', 'Papua Selatan'];
  List<String> containerTexts = ['1000', '1000', '1000', '1000'];
  List<String> containerTitles = [
    'Sawah',
    'Hutan Lindung',
    'Hutan Mangrove',
    'Rumah Warga'
  ];

  // Data marker dengan warna yang berbeda
  Map<String, List<Map<String, dynamic>>> markersData = {
    'Papua Barat': [
      {'point': LatLng(-2.0, 133.0), 'color': Colors.blue},
      {'point': LatLng(-3.1, 133.1), 'color': Colors.green},
      {'point': LatLng(-2.2, 133.2), 'color': Colors.yellow},
      {'point': LatLng(-3.3, 133.3), 'color': Colors.black},
      {'point': LatLng(-2.4, 133.4), 'color': Colors.orange},
    ],
    'Papua Tengah': [
      {'point': LatLng(-3.0, 137.0), 'color': Colors.blue},
      {'point': LatLng(-4.1, 137.1), 'color': Colors.green},
      {'point': LatLng(-3.2, 137.2), 'color': Colors.yellow},
      {'point': LatLng(-4.3, 137.3), 'color': Colors.black},
      {'point': LatLng(-3.4, 137.4), 'color': Colors.orange},
    ],
    'Papua Selatan': [
      {'point': LatLng(-5.9, 139.0), 'color': Colors.blue},
      {'point': LatLng(-6.1, 140.1), 'color': Colors.green},
      {'point': LatLng(-7.3, 140.2), 'color': Colors.yellow},
      {'point': LatLng(-6.5, 140.3), 'color': Colors.black},
      {'point': LatLng(-5.7, 140.4), 'color': Colors.orange},
    ],
  };

  List<Marker> currentMarkers = []; // Menyimpan marker yang ditampilkan

  void updateMarkers(String? value) {
    setState(() {
      currentMarkers = markersData[value]!.map((markerData) {
        return Marker(
          width: 80.0,
          height: 80.0,
          point: markerData['point'],
          builder: (ctx) => Container(
            child: Icon(
              Icons.location_on,
              color: markerData['color'], // Menggunakan warna yang sesuai
              size: 40.0,
            ),
          ),
        );
      }).toList();
    });
  }

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
                        'Lingkungan',
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
                                    updateMarkers(
                                        newValue); // Update marker saat dropdown dipilih
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
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 12,
                                    ),
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
                        Center(
                          child: Text(
                            "Umum",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        // Container untuk setiap data
                        Center(
                          child: Wrap(
                            spacing: 30, // Jarak horizontal antar container
                            runSpacing: 10, // Jarak vertikal antar container
                            children:
                                List.generate(containerTexts.length, (index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    containerTitles[index],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white70,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    height: 35,
                                    width: 135,
                                    decoration: BoxDecoration(
                                      color: primaryColor,
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
                                    child: Center(
                                      child: Text(
                                        containerTexts[index],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                        SizedBox(height: 30),

                        // Peta dengan Marker
                        Center(
                          child: Column(
                            children: [
                              Container(
                                width: 290,
                                height: 290, // Tinggi peta
                                child: FlutterMap(
                                  options: MapOptions(
                                    center: LatLng(-4.1, 137.2),
                                    zoom: 5.0, // Level zoom
                                  ),
                                  children: [
                                    TileLayer(
                                      urlTemplate:
                                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                      subdomains: ['a', 'b', 'c'],
                                    ),
                                    MarkerLayer(
                                      markers:
                                          currentMarkers, // Menampilkan marker saat ini
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: 10), // Spasi antara peta dan label
                              // Column untuk menampilkan titik-titik berwarna dan labelnya
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.0), // Jarak dari tepi layar
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Titik untuk Papua Barat
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: Colors.blue, // Warna untuk Papua Barat
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text('Sawah', style: TextStyle(color: Colors.white),),
                                        SizedBox(
                                            width: 30), // Jarak antar titik
                                      ],
                                    ),
                                    // Titik untuk Papua Tengah
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: Colors.green, // Warna untuk Papua Tengah
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text('Hutan Mangrove', style: TextStyle(color: Colors.white),),
                                        SizedBox(width: 30),
                                      ],
                                    ),
                                    // Titik untuk Papua Selatan
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: Colors.yellow, // Warna untuk Papua Selatan
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text('Hutan Lindung', style: TextStyle(color: Colors.white),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: Colors
                                                .grey, // Warna untuk Papua Selatan
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text('Rumah warga', style: TextStyle(color: Colors.white),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: Colors.orange, // Warna untuk Papua Selatan
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Text('SDA', style: TextStyle(color: Colors.white),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Tombol di pojok kanan bawah menggunakan Container dengan IconButton
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
                              builder: (context) => FormLingkungan()),
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
                              builder: (context) => EditLingkungan()),
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
}
