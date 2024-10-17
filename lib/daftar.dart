import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'otp.dart';
import 'masuk.dart';
import 'colors.dart';

class HalamanDaftar extends StatefulWidget {
  @override
  _HalamanDaftarState createState() => _HalamanDaftarState();
}

class _HalamanDaftarState extends State<HalamanDaftar> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context);
    final isDarkMode = theme.mode.isDark;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Gambar background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/t5.jpg'), // Ganti dengan path gambar background Anda
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Konten utama
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 95),
                Center(
                  child: Column(
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
                ),
                SizedBox(height: 30),
                // Ruang untuk konten tambahan jika diperlukan
                SizedBox(height: screenHeight * 0.2), // Memberi jarak dari atas
              ],
            ),
          ),
          // Kontainer di bagian bawah
          Align(
            alignment: Alignment.bottomCenter,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    //color: isDarkMode ? Colors.grey[800] : Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: 10),
                            Center(
                              child: Text(
                                'DAFTAR',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  //color: isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            _buildTextField('Nama Lengkap', isDarkMode),
                            SizedBox(height: 10),
                            _buildTextField('Email', isDarkMode),
                            SizedBox(height: 10),
                            _buildTextField('Username', isDarkMode),
                            SizedBox(height: 10),
                            _buildPasswordField('Password', _obscurePassword,
                                (bool value) {
                              setState(() {
                                _obscurePassword = value;
                              });
                            }, isDarkMode),
                            SizedBox(height: 10),
                            _buildPasswordField(
                                'Konfirmasi Password', _obscureConfirmPassword,
                                (bool value) {
                              setState(() {
                                _obscureConfirmPassword = value;
                              });
                            }, isDarkMode),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Sudah memiliki akun? ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                    //color: isDarkMode ? Colors.white : Colors.black87,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HalamanMasuk()),
                                    );
                                  },
                                  child: Text(
                                    'Masuk',
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
                                  MaterialPageRoute(
                                      builder: (context) => HalamanOTP()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: primaryColor,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 110, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Text(
                                'Daftar',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
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
