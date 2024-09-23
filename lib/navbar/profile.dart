import 'package:flutter/material.dart';
import 'package:projek1/colors.dart';
import 'package:projek1/setProfil.dart';
import 'pengaturan.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
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
            SizedBox(height: 20), // Menambahkan jarak antara header dan card
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // Mengatur posisi card agar lebih dekat ke atas
                children: <Widget>[
                  Card(
                    color: backgroundColor,
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Profile'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfileDetailPage()),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Card(
                    color: backgroundColor,
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Pengaturan'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SettingsPage()),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  Card(
                    color: backgroundColor,
                    elevation: 5,
                    child: ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Logout'),
                      onTap: () {
                        // Add your logout logic here
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

