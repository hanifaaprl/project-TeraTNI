import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:projek1/colors.dart';
import 'package:projek1/splashscreen.dart';

class HalamanVerifikasi extends StatefulWidget {
  @override
  _HalamanVerifikasiState createState() => _HalamanVerifikasiState();
}

class _HalamanVerifikasiState extends State<HalamanVerifikasi> {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan tema saat ini
    final theme = AdaptiveTheme.of(context);
    final isDarkMode = theme.mode.isDark;

    return Scaffold(
      //backgroundColor: isDarkMode ? Colors.black : Colors.white,
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 80), 
                  _buildOTPOptions(isDarkMode),
                  SizedBox(height: 20),
                  _buildOTPKotak(isDarkMode),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HalamanSplashscreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 130, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Verifikasi',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Belum menerima kode?',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                          //color: isDarkMode ? Colors.white70 : Colors.black87,
                        ),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          // Aksi pengiriman ulang kode
                        },
                        child: Text(
                          'Kirim ulang kode',
                          style: TextStyle(
                            fontSize: 12,
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
                    //color: isDarkMode ? Colors.white : Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 20),
                Text(
                  'Verifikasi - OTP',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    //color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOTPOptions(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cek Email Anda',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            //color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        Text(
          'Kami telah mengirimkan kode ke example@gmail.com',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white70,
            //color: isDarkMode ? Colors.white70 : Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildOTPKotak(bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(5, (index) {
        return SizedBox(
          width: 50,
          child: TextFormField(
            onChanged: (value) {
              if (value.length == 1 && index < 4) {
                FocusScope.of(context).nextFocus(); 
              } else if (value.length == 1 && index == 4) {
                FocusScope.of(context).unfocus(); 
              }
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: primaryColor, width: 1.0), // Mengatur ketebalan garis pinggir
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: primaryColor, width: 1.0), // Menambahkan garis putih untuk border normal
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: primaryColor, width: 1.0), // Garis putih saat fokus
              ),
              filled: true,
              fillColor: secondaryColor,
            ),
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            buildCounter: (BuildContext context,
                {int? currentLength, bool? isFocused, int? maxLength}) {
              return null;
            },
          ),
        );
      }),
    );
  }
}
