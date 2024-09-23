import 'package:flutter/material.dart';
import 'package:projek1/colors.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:projek1/notif.dart';
import 'package:projek1/personil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedValue = 'Papua'; // Nilai default dropdown

  @override
  Widget build(BuildContext context) {
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
                      items: <String>['Papua', 'Maluku', 'Ternate']
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
                              builder: (context) =>
                                  PersonilAktif()), 
                        );
                      },
                      child: Container(
                        width: 172,
                        height: 250,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(2, 2),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(9),
                          child: Text(
                            'Personil Aktif',
                            style: TextStyle(
                              color: Colors.white, // Warna teks
                              fontSize: 13, // Ukuran teks
                              fontWeight: FontWeight.bold, // Ketebalan teks
                            ),
                            textAlign: TextAlign.center, // Rata tengah teks
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
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Kavaleri",
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(height: 10),
                          // Container kecil 1
                          _buildSmallContainer('2000'),
                          SizedBox(height: 10),
                          Text(
                            "Infanteri",
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(height: 10),
                          _buildSmallContainer('750'),
                          SizedBox(height: 10),
                          Text(
                            "Artileri",
                            style: TextStyle(fontSize: 12),
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
                    Container(
                      width: 172,
                      height: 210,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(2, 2),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(9),
                        child: Text(
                          'Kekuatan Laut',
                          style: TextStyle(
                            color: Colors.white, // Warna teks
                            fontSize: 13, // Ukuran teks
                            fontWeight: FontWeight.bold, // Ketebalan teks
                          ),
                          textAlign: TextAlign.center, // Rata tengah teks
                        ),
                      ),
                    ),
                    SizedBox(width: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        _buildSmallContainer('Sosial Ekonomi'),
                        SizedBox(height: 10),
                        _buildSmallContainer('Demografis'),
                        SizedBox(height: 10),
                        _buildSmallContainer('Geografis'),
                        SizedBox(height: 10),
                        _buildSmallContainer('Lingkungan'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20), // Tambahan jarak
                // Widget peta OpenStreetMap
                Container(
                  height: 300, // Tinggi peta
                  child: Stack(
                    children: [
                      FlutterMap(
                        options: MapOptions(
                          center: LatLng(-3.0, 135.0),
                          zoom: 10.0, // Level zoom
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
                                point: LatLng(-3.0, 135.0),
                                builder: (ctx) => Container(
                                  child: Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                    size: 40.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
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

  // Widget untuk membangun kontainer kecil
  Widget _buildSmallContainer(String text) {
    return Container(
      width: 120,
      height: 40,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(2, 2),
          ),
        ],
      ),
    );
  }
}
