import 'package:flutter/material.dart';
import 'package:projek1/addLaporan.dart';
import 'package:projek1/colors.dart';
import 'package:projek1/notif.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  String? selectedValue; // Variabel untuk menampung pilihan dropdown
  List<String> dropdownItems = [
    'Wilayah A',
    'Wilayah B',
    'Wilayah C'
  ]; // Daftar item dropdown

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context);
    final isDarkMode = theme.mode.isDark;
    return Scaffold(
      backgroundColor: backgroundColor,
      //backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                      height: 40,
                      width: 40,
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
                          Icons.add,
                          size: 20,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Addlaporan()),
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 40,
                      width: 40,
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
                          size: 20,
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
                SizedBox(height: 20),
                // Row untuk dropdown di kiri dan TextField di kanan
                Row(
                  children: [
                    // Dropdown di kiri
                    Container(
                      width: 120,
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
                          dropdownColor: secondaryColor, // Warna dropdown
                          icon: Icon(Icons.keyboard_arrow_down_rounded,
                              color: Colors.white), // Ikon dropdown
                          hint: Row(
                            children: [
                              SizedBox(width: 5), // Jarak antara ikon dan teks
                              Text(
                                "Papua",
                                style: TextStyle(
                                  color: Colors.white, // Warna teks dropdown
                                  fontSize: 14,
                                ),
                              ),
                            ],
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
                              selectedValue =
                                  newValue; // Update pilihan dropdown
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // Spasi antara dropdown dan pencarian
                    // TextField di kanan
                    Expanded(
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color:
                              secondaryColor, // Warna latar belakang TextField menjadi putih
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.black.withOpacity(0.2), // Warna shadow
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 5), // Arah dan jarak shadow
                            ),
                          ],
                        ),
                        child: TextField(
                          style: TextStyle(
                              fontSize: 12,
                              color:
                                  Colors.black), // Warna teks pencarian hitam
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.search,
                                color: Colors.grey), // Warna ikon pencarian
                            hintText: "Cari ...",
                            hintStyle: TextStyle(
                                color: Colors.grey), // Warna hint text
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide
                                  .none, // Hilangkan border agar sesuai dengan container
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20), // Jarak antara input dan card berita
                // Card berita dengan teks di atas gambar
                // Bagian Column yang menampilkan Card berita
                Column(
                  children: [
                    // Card 1
                    GestureDetector(
                      onTap: () {
                       
                      },
                      child: Card(
                        margin: EdgeInsets.only(bottom: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12)),
                              child: Image.asset(
                                'assets/images/banjir.jpg',
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                color: Colors.black.withOpacity(0.3),
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Banjir Bandang landa Papua tengah, 4 orang tewas',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Baru saja',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Card 2 (Kartu lainnya mengikuti format yang sama)
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Card(
                        margin: EdgeInsets.only(bottom: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12)),
                              child: Image.asset(
                                'assets/images/kkb.jpg',
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                color: Colors.black.withOpacity(0.3),
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'KKB tembak pilot heli WN Selandia baru hingga tewas',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '5 menit yang lalu',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: Card(
                        margin: EdgeInsets.only(bottom: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12)),
                              child: Image.asset(
                                'assets/images/gempa.jpg',
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                color: Colors.black.withOpacity(0.3),
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'KKB tembak pilot heli WN Selandia baru hingga tewas',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '5 menit yang lalu',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
