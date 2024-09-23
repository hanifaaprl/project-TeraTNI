import 'package:flutter/material.dart';
import 'package:projek1/otp2.dart';
import 'colors.dart';

class HalamanOTP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 80),
                _buildOTPOptions(),
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
                    color: Colors.black,
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
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOTPOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pilih salah satu opsi di bawah ini untuk mendapatkan kode verifikasi.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 25),
        ElevatedButton(
          onPressed: () {
            // Aksi untuk mengirim OTP melalui email
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 0, 0, 0),
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(
                    color: const Color.fromARGB(120, 0, 0, 0), width: 0.7)),
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
                ),
              ),
              SizedBox(width: 120),
              Icon(Icons.vpn_key_outlined, size: 25),
            ],
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // Aksi untuk mengirim OTP melalui WhatsApp
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 0, 0, 0),
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(
                    color: Color.fromARGB(129, 0, 0, 0), width: 0.7)),
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
                ),
              ),
              SizedBox(width: 90),
              Icon(Icons.vpn_key_outlined, size: 25)
            ],
          ),
        ),
      ],
    );
  }
}
