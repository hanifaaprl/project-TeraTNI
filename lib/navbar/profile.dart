import 'package:flutter/material.dart';
import 'package:projek1/colors.dart';
import 'package:projek1/masuk.dart';
import 'package:projek1/onboarding.dart';
import 'package:projek1/setProfil.dart';
import 'pengaturan.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context);
    final isDarkMode = theme.mode.isDark;

    // Tentukan warna berdasarkan mode gelap atau terang
    //final backgroundColor = isDarkMode ? Colors.grey[900] : Colors.white;
    // final cardColor = isDarkMode ? Colors.grey[800] : Colors.white;
    // final textColor = isDarkMode ? Colors.white : Colors.black87;
    final cardColor = secondaryColor;
    final textColor = primaryColor;

    return Scaffold(
      backgroundColor: backgroundColor, // Background mengikuti tema
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Image.asset(
                    'assets/images/logoo.png',
                    width: 35,
                    height: 35,
                    fit: BoxFit.cover,
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 20), // Jarak antara header dan card
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // Card lebih dekat ke atas
                children: <Widget>[
                  // Card 1 - Profile
                  Card(
                    color: cardColor, // Warna card mengikuti tema
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(Icons.person, color: textColor), // Warna icon mengikuti tema
                      title: Text(
                        'Profile',
                        style: TextStyle(color: textColor), // Warna teks mengikuti tema
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfileDetailPage()),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),

                  // Card 2 - Pengaturan
                  Card(
                    color: cardColor, // Warna card mengikuti tema
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(Icons.settings, color: textColor), // Warna icon mengikuti tema
                      title: Text(
                        'Pengaturan',
                        style: TextStyle(color: textColor), // Warna teks mengikuti tema
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SettingsPage()),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),

                  // Card 3 - Logout
                  Card(
                    color: cardColor, // Warna card mengikuti tema
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(Icons.logout, color: textColor), // Warna icon mengikuti tema
                      title: Text(
                        'Logout',
                        style: TextStyle(color: textColor), // Warna teks mengikuti tema
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HalamanMasuk()),
                        );
                      },
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
