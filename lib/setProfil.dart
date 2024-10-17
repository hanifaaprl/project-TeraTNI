import 'package:flutter/material.dart';
import 'colors.dart'; // File di mana primaryColor dan backgroundColor didefinisikan

class ProfileDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          // Bagian atas dengan IconButton dan teks
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            color: backgroundColor, // Background untuk bagian header
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 85),
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          // Konten utama
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                // Profile Picture
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/images/profile.jpeg'), // Ganti dengan path gambar profil jika ada
                  ),
                ),
                SizedBox(height: 20),
                // Nama Lengkap
                _buildProfileInfo('Nama Lengkap', 'John Isslah'),
                SizedBox(height: 10),
                // Jenis Kelamin
                _buildProfileInfo('Jenis Kelamin', 'Laki-laki'),
                SizedBox(height: 10),
                // Email
                _buildProfileInfo('Email', 'John@example.com'),
                SizedBox(height: 10),
                // Alamat
                _buildProfileInfo('Alamat', 'Jl. Contoh Alamat No. 123'),
                SizedBox(height: 10),
                // Lokasi
                _buildProfileInfo('Lokasi', 'Kota Bandung'),
                SizedBox(height: 10),
                // Nomor Telepon
                _buildProfileInfo('Nomor Telepon', '+62 123 456 7890'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk menampilkan informasi profil
  Widget _buildProfileInfo(String label, String value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
        title: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        subtitle: Text(
          value,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
