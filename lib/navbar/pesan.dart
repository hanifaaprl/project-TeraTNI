import 'package:flutter/material.dart';
import 'package:projek1/colors.dart';
import 'package:projek1/notif.dart';
//import 'package:adaptive_theme/adaptive_theme.dart';

class PesanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:backgroundColor, // Latar belakang putih
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                // Logo dan ikon notifikasi
                Row(
                  children: [
                    Image.asset(
                      'assets/images/logoo.png',
                      width: 35,
                      height: 35,
                      fit: BoxFit.cover,
                    ),
                    Spacer(),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: primaryColor, // Warna latar belakang ikon
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
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[200], // Warna latar belakang TextField
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    style: TextStyle(fontSize: 12, color: Colors.black), // Warna teks
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search, color: Colors.black), // Warna ikon
                      hintText: "Cari ...",
                      hintStyle: TextStyle(color: Colors.grey), // Warna hint
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Daftar chat
                ChatItem(
                  sender: "Hanifah",
                  message: "Halo! Apa kabar?",
                  time: "10:30 AM",
                ),
                ChatItem(
                  sender: "Budi",
                  message: "Ada pertemuan nanti sore?",
                  time: "09:45 AM",
                ),
                ChatItem(
                  sender: "Aisyah",
                  message: "Sudah menyelesaikan tugas kemarin?",
                  time: "08:15 AM",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Halaman Chating
class ChatPage extends StatelessWidget {
  final String sender;

  ChatPage({required this.sender});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with $sender', style: TextStyle(color: Colors.white)), // Warna teks judul
        backgroundColor: primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white, // Warna latar belakang body
              child: ListView(
                children: [
                  // Contoh pesan di halaman chat
                  Text(
                    "$sender: Halo! Bagaimana kabarmu?",
                    style: TextStyle(fontSize: 16, color: Colors.black), // Warna teks
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Kamu: Baik! Bagaimana denganmu?",
                    style: TextStyle(fontSize: 16, color: Colors.black), // Warna teks
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ketik pesan...',
                      hintStyle: TextStyle(color: Colors.grey), // Warna hint
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: primaryColor), // Warna ikon kirim
                  onPressed: () {
                    // Aksi ketika tombol kirim ditekan
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String sender;
  final String message;
  final String time;

  const ChatItem({
    required this.sender,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman ChatPage ketika chat diklik
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(sender: sender),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: primaryColor,
              child: Text(
                sender[0], // Mengambil huruf pertama dari nama pengirim
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sender,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black, // Warna teks pengirim
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    message,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600), // Warna teks pesan
                  ),
                ],
              ),
            ),
            Text(
              time,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
