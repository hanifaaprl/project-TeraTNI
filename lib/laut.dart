import 'package:flutter/material.dart';
import 'colors.dart';

class KekuatanLaut extends StatefulWidget {
  @override
  _KekuatanLautState createState() => _KekuatanLautState();
}

class _KekuatanLautState extends State<KekuatanLaut> {
  String? _selectedValue;

  final List<Map<String, String>> containerItems = [
    {'image': 'assets/images/fre.png', 'text': '7  Fregat'},
    {'image': 'assets/images/kor.png', 'text': '24  Korvet'},
    {'image': 'assets/images/sel.png', 'text': '5  Kapal Selam'},
    {'image': 'assets/images/pat.png', 'text': '179  Kapal Patroli'},
    {'image': 'assets/images/ran.png', 'text': '10  Kapal Ranjau'},
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
                  'Kekuatan Laut',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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
                        items: <String>['Kodam III/Siliwangi', 'kodam IV/Diponegoro', 'Kodam V/Brawijaya','Kodam XVII/Cenderawasih']
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
                  SizedBox(height: 20),

                  // Daftar card dengan gambar di kiri dan teks di kanan
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(), // Agar bisa di-scroll dalam SingleChildScrollView
                    itemCount: containerItems.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Color(0xFF1E1E1E),
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              // Gambar di kiri
                              Image.asset(
                                containerItems[index]['image']!,
                                width: 70,
                                height: 70,
                              ),
                              SizedBox(width: 10),
                              // Teks di kanan
                              Expanded(
                                child: Text(
                                  containerItems[index]['text']!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, // Warna teks dalam card
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
