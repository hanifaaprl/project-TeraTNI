import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:projek1/colors.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  String? selectedValue; // Variabel untuk menampung pilihan dropdown
  List<String> dropdownItems = [
    'Papua Tengah',
    'Papua Barat',
    'Papua Selatan'
  ]; // Daftar item dropdown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          // Peta
          FlutterMap(
            options: MapOptions(
              center: LatLng(-3.0, 135.0), // Koordinat Papua Tengah
              zoom: 10.0, // Level zoom
            ),
            children: [
              TileLayer(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(-3.0, 135.0), // Koordinat marker
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
          // Dropdown dan TextField di atas peta
          Positioned(
            top: 60, // Jarak dari atas layar
            left: 20,
            right: 20,
            child: Column(
              children: [
                // Row untuk Dropdown di kiri dan TextField di kanan
                Row(
                  children: [
                    // Dropdown di sebelah kiri
                    Container(
                      width: 140,
                      height: 30,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(2, 2), // Efek shadow
                          ),
                        ],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedValue,
                          hint: Text(
                            "Papua",
                            style: TextStyle(color: Colors.white), // Warna teks hint dropdown
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white, // Warna icon dropdown
                          ),
                          style: TextStyle(color: Colors.white),
                          dropdownColor: secondaryColor, // Warna background dropdown
                          items: dropdownItems.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedValue = newValue; // Update pilihan dropdown
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // Jarak antara dropdown dan textfield

                    // TextField di sebelah kanan
                    Expanded(
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white, // Background warna untuk TextField
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(2, 2), // Efek shadow
                            ),
                          ],
                        ),
                        child: TextField(
                          style: TextStyle(fontSize: 12),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white, // Warna latar belakang
                            suffixIcon: Icon(
                              Icons.search_sharp,
                              color: Colors.grey, // Warna ikon search
                            ),
                            hintText: "Cari ...",
                            hintStyle: TextStyle(color: Colors.grey), // Warna hint text
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none, // Menghilangkan border agar sesuai dengan dekorasi container
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Tombol di atas navbar
          Positioned(
            bottom: 110, // Jarak dari bawah layar
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Menentukan ukuran tombol yang konsisten
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Aksi ketika Button 1 ditekan
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15), // Padding tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // Border radius tombol
                        side: BorderSide(color: Colors.black, width: 1), // Garis pinggir (border)
                      ),
                      backgroundColor: backgroundColor, // Warna background button
                    ),
                    child: Text(
                      'Posko Militer',
                      style: TextStyle(color: Colors.black), // Warna teks button
                      textAlign: TextAlign.center,
                      maxLines: 2, // Membuat teks dalam 2 baris jika diperlukan
                      overflow: TextOverflow.ellipsis, // Menghilangkan teks yang berlebih
                    ),
                  ),
                ),
                SizedBox(width: 10), // Spasi antar tombol
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Aksi ketika Button 2 ditekan
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15), // Padding tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // Border radius tombol
                        side: BorderSide(color: Colors.black, width: 1), // Garis pinggir (border)
                      ),
                      backgroundColor: backgroundColor, // Warna background button
                    ),
                    child: Text(
                      'Fasilitas Umum',
                      style: TextStyle(color: Colors.black), // Warna teks button
                      textAlign: TextAlign.center,
                      maxLines: 2, // Membuat teks dalam 2 baris jika diperlukan
                      overflow: TextOverflow.ellipsis, // Menghilangkan teks yang berlebih
                    ),
                  ),
                ),
                SizedBox(width: 10), // Spasi antar tombol
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Aksi ketika Button 3 ditekan
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 15), // Padding tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // Border radius tombol
                        side: BorderSide(color: Colors.black, width: 1), // Garis pinggir (border)
                      ),
                      backgroundColor: backgroundColor, // Warna background button
                    ),
                    child: Text(
                      'Komplek Militer',
                      style: TextStyle(color: Colors.black), // Warna teks button
                      textAlign: TextAlign.center,
                      maxLines: 2, // Membuat teks dalam 2 baris jika diperlukan
                      overflow: TextOverflow.ellipsis, // Menghilangkan teks yang berlebih
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
