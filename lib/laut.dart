import 'package:flutter/material.dart';
import 'colors.dart';

class KekuatanLaut extends StatefulWidget {
  @override
  _KekuatanLautState createState() => _KekuatanLautState();
}

class _KekuatanLautState extends State<KekuatanLaut> {
  String? _selectedValue; 

  final List<String> containerTexts = [
    'Fregat : 1000',
    'Korvet : 1000',
    'Kapal Selam : 1000',
    'Kapal Patroli : 1000',
    'Kapal Ranjau : 1000'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          // Header
          Positioned(
            top: 40,
            left: 10,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 24,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 20),
                Text(
                  'Kekuatan Laut',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          // Konten utama
          Positioned.fill(
            top: 100, // Mengatur posisi konten di bawah header
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Dropdown
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 35,
                    width: 300,
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
                                color: Colors.white, // Warna teks item
                              ),
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
                          style: TextStyle(color: Colors.white), // Warna teks hint
                        ),
                        dropdownColor: secondaryColor,
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.white,
                        ),
                        isDense: true,
                      ),
                    ),
                  ),
                  
                  // Gambar
                  Center(
                      child: Image.asset(
                        'assets/images/laut.png',
                        height: 300, // Atur tinggi gambar
                        width: 300, // Atur lebar gambar
                      ),
                    ),
                    Text(
                    'Perwira $_selectedValue',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    spacing: 10, // Jarak horizontal antar container
                    runSpacing: 10, // Jarak vertikal antar container
                    children: List.generate(containerTexts.length, (index) {
                      return Container(
                        height: 50,
                        width: 150,
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
                              color: Colors.white, // Warna teks
                              fontSize: 14, // Ukuran teks
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
