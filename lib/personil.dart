import 'package:flutter/material.dart';
import 'colors.dart';

class PersonilAktif extends StatefulWidget {
  @override
  _PersonilAktifState createState() => _PersonilAktifState();
}

class _PersonilAktifState extends State<PersonilAktif> {
  String _selectedValue = 'Papua';

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
                  'Personil Aktif',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          
          // Dropdown and Image
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Column(
              children: [
                // Dropdown
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10), // Mengurangi padding horizontal
                  height: 35, // Mengecilkan tinggi dropdown
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
                      isDense: true, // Mengecilkan ketinggian dropdown item
                    ),
                  ),
                ),
                
                // Jarak antara dropdown dan gambar
                SizedBox(height: 20),
                
                // Gambar
                Center(
                  child: Image.asset(
                    'assets/images/personil.png', // Pastikan path gambar sudah benar
                    height: 150, // Atur tinggi gambar
                    width: 150, // Atur lebar gambar
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
