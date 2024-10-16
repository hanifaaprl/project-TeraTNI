import 'package:flutter/material.dart';
import 'colors.dart';

class PersonilAktif extends StatefulWidget {
  @override
  _PersonilAktifState createState() => _PersonilAktifState();
}

class _PersonilAktifState extends State<PersonilAktif> {
  String _selectedValue = 'Papua';

  // Daftar teks untuk setiap container
  final List<String> Perwira = [
    'LetJen : 2',
    'MayJen : 8',
    'BrigJen : 8',
    'Kolonel : 8',
    'Letkol : 8',
    'Mayor : 8',
    'Kapten : 8',
    'LetTu : 8',
    'LetDa : 8'
  ];

  final List<String> Bantara = [
    'PelTu : 100',
    'PelDa : 100',
    'Serma : 100',
    'Serka : 100',
    'Sertu : 100',
    'Serda : 100'
  ];

  final List<String> Tamtama = [
    'KopKa : 1000',
    'KopTu : 1000',
    'KopDa : 1000',
    'PraKa : 1000',
    'PraTu : 1000',
    'PraDa : 1000'
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
                    color: Colors.white,
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
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Konten yang dapat di-scroll
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
                        items: <String>['Papua','Papua Barat', 'Papua tengah', 'Papua Selatan']
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
                  Center(
                    child: Builder(
                      builder: (context) {
                        try {
                          return Image.asset(
                            'assets/images/personil.png',
                            height: 300, // Atur tinggi gambar
                            width: 300, // Atur lebar gambar
                          );
                        } catch (e) {
                          return Text('Gambar tidak ditemukan.');
                        }
                      },
                    ),
                  ),
                  Text(
                    'Perwira $_selectedValue',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    spacing: 10, // Jarak horizontal antar container
                    runSpacing: 10, // Jarak vertikal antar container
                    children: List.generate(Perwira.length, (index) {
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
                            Perwira[index],
                            style: TextStyle(
                              color: Colors.white, // Warna teks
                              fontSize: 14, // Ukuran teks
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Bantara $_selectedValue',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    spacing: 10, // Jarak horizontal antar container
                    runSpacing: 10, // Jarak vertikal antar container
                    children: List.generate(Bantara.length, (index) {
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
                            Bantara[index],
                            style: TextStyle(
                              color: Colors.white, // Warna teks
                              fontSize: 14, // Ukuran teks
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Tamtama $_selectedValue',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    spacing: 10, // Jarak horizontal antar container
                    runSpacing: 10, // Jarak vertikal antar container
                    children: List.generate(Tamtama.length, (index) {
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
                            Tamtama[index],
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
