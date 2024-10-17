import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'daftar.dart';
import 'otp.dart';
import 'colors.dart';

class HalamanMasuk extends StatefulWidget {
  @override
  _HalamanMasukState createState() => _HalamanMasukState();
}

class _HalamanMasukState extends State<HalamanMasuk> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context);
    final isDarkMode = theme.mode.isDark;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/t5.jpg'), // Gambar background
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.25), // Memberi jarak dari atas
                  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            child: Image.asset(
                              'assets/images/logoo.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: 10),
                          Column(
                            children: [
                              Text(
                                'TeraTNI',
                                style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  //color: isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                              Text(
                            'Hello, welcome!',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white70,
                              //color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                            ],
                          ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter, // Meletakkan kontainer di bagian bawah
            child: Container(
              width: screenWidth, // Lebar sesuai layar
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: secondaryColor,
                //color: isDarkMode ? Colors.grey[800] : Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      'MASUK',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        //color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  _buildTextField('Username', isDarkMode),
                  SizedBox(height: 10),
                  _buildPasswordField('Password', _obscurePassword, (bool value) {
                    setState(() {
                      _obscurePassword = value;
                    });
                  }, isDarkMode),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Lupa password?',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HalamanOTP()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 110, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Masuk',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Belum memiliki akun? ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                          //color: isDarkMode ? Colors.white70 : Colors.black87,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HalamanDaftar()), 
                            );
                          },
                        child: Text(
                          'Daftar',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String labelText, bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
        SizedBox(height: 6),
        Container(
          height: 35,
          child: TextField(
            style: TextStyle(fontSize: 14, color: Colors.white), // Warna teks putih agar terlihat pada background secondaryColor
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white, width: 1.0), // Mengatur ketebalan garis pinggir
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white, width: 1.0), // Menambahkan garis putih untuk border normal
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white, width: 1.0), // Garis putih saat fokus
              ),
              filled: true,
              fillColor: secondaryColor, // Mengubah warna background menjadi secondaryColor
            ),
          ),
        ),
      ],
    );
  }


    Widget _buildPasswordField(String labelText, bool obscureText, Function(bool) toggleVisibility, bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
        SizedBox(height: 6),
        Container(
          height: 35,
          child: TextField(
            obscureText: obscureText,
            style: TextStyle(fontSize: 14, color: Colors.white), // Warna teks putih agar terlihat pada background secondaryColor
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white, width: 1.0), // Mengatur ketebalan garis pinggir
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white, width: 1.0), // Menambahkan garis putih untuk border normal
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.white, width: 1.0), // Garis putih saat fokus
              ),
              filled: true,
              fillColor: secondaryColor, // Mengubah warna background menjadi secondaryColor
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  size: 20,
                  color: Colors.white, // Warna icon agar terlihat jelas
                ),
                onPressed: () => toggleVisibility(!obscureText),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
