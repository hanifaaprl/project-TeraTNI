import 'package:flutter/material.dart';
import 'colors.dart'; // File di mana primaryColor dan backgroundColor didefinisikan

class Notif extends StatefulWidget {
  @override
  _NotifState createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  // Variabel untuk melacak tombol yang diklik
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Notifikasi",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20), // Jarak antara AppBar dan tombol
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Scroll secara horizontal
              child: Row(
                children: [
                  CustomButton(
                    text: 'Notifikasi saya',
                    isSelected: _selectedIndex == 0,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0; // Set indeks untuk tombol ini
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  CustomButton(
                    text: 'Notifikasi Event',
                    isSelected: _selectedIndex == 1,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 1; // Set indeks untuk tombol ini
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  CustomButton(
                    text: 'Notifikasi Pesan',
                    isSelected: _selectedIndex == 2,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 2; // Set indeks untuk tombol ini
                      });
                    },
                  ),
                  SizedBox(width: 10),
                  CustomButton(
                    text: 'Notifikasi Lain',
                    isSelected: _selectedIndex == 3,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 3; // Set indeks untuk tombol ini
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20), // Jarak antara tombol dan teks
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Hari Ini',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                NotificationCard(
                  icon: Icons.event_available_outlined,
                  title: 'John Isslah',
                  description: 'Undangan Reuni terbaru',
                ),
                SizedBox(height: 10),
                NotificationCard(
                  icon: Icons.circle_notifications_sharp,
                  title: 'Notifikasi 2',
                  description: 'Deskripsi dari notifikasi 2.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// CustomButton widget untuk mengatur warna tombol
class CustomButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  CustomButton({
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? primaryColor : Colors.white, // Warna berubah saat ditekan
        foregroundColor: isSelected ? Colors.white : primaryColor, // Warna teks berubah
        side: BorderSide(color: primaryColor), // Border untuk tombol
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        textStyle: TextStyle(fontSize: 16),
      ),
      child: Text(text),
    );
  }
}

// NotificationCard widget untuk menampilkan card dengan icon dan teks
class NotificationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  NotificationCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: secondaryColor, // Warna background card
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white, // Warna icon
              size: 40,
            ),
            SizedBox(width: 16), // Jarak antara icon dan teks
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Warna teks judul
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.7), // Warna teks deskripsi
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
