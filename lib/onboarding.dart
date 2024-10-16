import 'package:flutter/material.dart';
import 'package:projek1/masuk.dart';  // Halaman masuk
import 'daftar.dart';  // Halaman daftar
import 'colors.dart';  // Warna yang digunakan

class HalamanUtama extends StatefulWidget {
  @override
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  bool isNavigated = false; // To avoid multiple navigations

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/t5.jpg', // Path to your image
              fit: BoxFit.cover, // Make the image cover the whole background
            ),
          ),
          // Center Container with logo and text
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Image
                Image.asset(
                  'assets/images/logoo.png', // Path to your logo image
                  width: 50, // Set your desired width
                  height: 50, // Set your desired height
                ),
                SizedBox(height: 0), // Space between logo and text
                Text(
                  'TeraTNI', // Replace with your app name
                  style: TextStyle(
                    fontSize: 29, // Font size for app name
                    fontWeight: FontWeight.bold, // Bold text
                    color: Colors.grey, // Text color
                  ),
                ),
              ],
            ),
          ),
          // Swipeable Container
          DraggableScrollableSheet(
            initialChildSize: 0.1, // Start size of the container
            minChildSize: 0.1,     // Minimum size (collapsed)
            maxChildSize: 0.2,     // Maximum size (expanded)
            builder: (BuildContext context, ScrollController scrollController) {
              return NotificationListener<DraggableScrollableNotification>(
                onNotification: (notification) {
                  // Check if the extent is greater than a certain value (e.g., 20% of maxExtent)
                  if (notification.extent >= 0.2 && !isNavigated) {
                    // Set a flag to prevent multiple navigations
                    setState(() {
                      isNavigated = true;
                    });

                    // Navigate to the login page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HalamanMasuk()),
                    ).then((value) {
                      // Reset the flag when the user comes back
                      setState(() {
                        isNavigated = false;
                      });
                    });
                  }
                  return true;
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 5,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      // Icon for swipe up
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Icon(
                            Icons.keyboard_double_arrow_up_sharp, // Swipe up icon
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          // Text outside the container
          Positioned(
            top: 550, // Position the text 50 pixels from the top
            left: 20, // Position the text 20 pixels from the left
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
              children: [
                Row(
                  children: [
                    Text(
                      'Swipe Up', // Your text here
                      style: TextStyle(
                        fontSize: 24, // Font size
                        fontWeight: FontWeight.bold, // Bold text
                        color: Colors.black54, // Text color
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'to', // Your text here
                      style: TextStyle(
                        fontSize: 24, // Font size
                        //fontWeight: FontWeight.bold, // Bold text
                        color: Colors.white60, // Text color
                      ),
                    ),
                  ],
                ),
                Text(
                  'to Explore the', // Your text here
                  style: TextStyle(
                    fontSize: 24, // Font size
                    //fontWeight: FontWeight.bold, // Bold text
                    color: Colors.white60, // Text color
                  ),
                ),
                Text(
                  'Teritorial', // Your text here
                  style: TextStyle(
                    fontSize: 24, // Font size
                    //fontWeight: FontWeight.bold, // Bold text
                    color: Colors.white60, // Text color
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
