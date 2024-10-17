import 'package:flutter/material.dart';
import 'package:projek1/colors.dart'; // File di mana primaryColor dan backgroundColor didefinisikan

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = false; // Variabel untuk status notifikasi
  bool _darkModeEnabled = false; // Variabel untuk status mode gelap

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            color: backgroundColor,
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
                SizedBox(width: 15),
                Text(
                  'Pengaturan',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                // Edit Profile
                _buildSettingsOption(
                  'Edit Profile',
                  Icons.edit,
                  () {
                    // Aksi untuk Edit Profile
                  },
                ),
                SizedBox(height: 10),
                // Ubah Password
                _buildSettingsOption(
                  'Ubah Password',
                  Icons.lock,
                  () {
                    // Aksi untuk Ubah Password
                  },
                ),
                SizedBox(height: 20),
                // Notifikasi
                _buildSwitchOption(
                  'Notifikasi',
                  _notificationsEnabled,
                  (bool value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                // Mode Terang/Gelap
                _buildSwitchOption(
                  'Mode Terang/Gelap',
                  _darkModeEnabled,
                  (bool value) {
                    setState(() {
                      _darkModeEnabled = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk menampilkan opsi pengaturan
  Widget _buildSettingsOption(String title, IconData icon, VoidCallback onTap) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
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
        leading: Icon(icon, color: primaryColor),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  // Widget untuk menampilkan opsi dengan switch
  Widget _buildSwitchOption(String title, bool value, ValueChanged<bool> onChanged) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10),
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
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: primaryColor,
        ),
      ),
    );
  }
}
 