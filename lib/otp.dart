import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:projek1/otp2.dart';
import 'colors.dart';

class HalamanOTP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil tema saat ini
    final theme = AdaptiveTheme.of(context);
    final isDarkMode = theme.mode.isDark;

    return Scaffold(
      //backgroundColor: isDarkMode ? Colors.black : Colors.white,
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 80),
                _buildOTPOptions(isDarkMode),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HalamanVerifikasi()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: primaryColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: 130, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'Lanjutkan',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
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
          'Pilih salah satu opsi di bawah ini untuk mendapatkan kode verifikasi.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white70,
            //color: isDarkMode ? Colors.white60 : Colors.black,
          ),
        ),
        SizedBox(height: 25),
        ElevatedButton(
          onPressed: () {
            // Aksi untuk mengirim OTP melalui email
          },
          style: ElevatedButton.styleFrom(
            // foregroundColor: const Color.fromARGB(255, 0, 0, 0),
            // backgroundColor: isDarkMode ? Colors.grey[850] : Colors.white,
            foregroundColor: Colors.white,
            backgroundColor: secondaryColor,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                color: const Color.fromARGB(120, 0, 0, 0),
                width: 0.7,
              ),
            ),
            elevation: 5,
            shadowColor: Colors.black.withOpacity(0.3),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/emaill.png',
                width: 30,
                height: 30,
              ),
              SizedBox(width: 10),
              Text(
                'Send via Email',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  //color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(width: 120),
              Icon(
                Icons.vpn_key_outlined,
                size: 25,
                color: Colors.white,
                //color: isDarkMode ? Colors.white : Colors.black,
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // Aksi untuk mengirim OTP melalui WhatsApp
          },
          style: ElevatedButton.styleFrom(
            // foregroundColor: const Color.fromARGB(255, 0, 0, 0),
            // backgroundColor: isDarkMode ? Colors.grey[850] : Colors.white,
            foregroundColor: Colors.white,
            backgroundColor: secondaryColor,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                color: Color.fromARGB(129, 0, 0, 0),
                width: 0.7,
              ),
            ),
            elevation: 5,
            shadowColor: Colors.black.withOpacity(0.3),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/waa.png',
                width: 30,
                height: 30,
              ),
              SizedBox(width: 10),
              Text(
                'Send via WhatsApp',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  //color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(width: 90),
              Icon(
                Icons.vpn_key_outlined,
                size: 25,
                color: Colors.white,
                //color: isDarkMode ? Colors.white : Colors.black,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
