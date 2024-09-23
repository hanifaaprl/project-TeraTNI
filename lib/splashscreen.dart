import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'load.dart';
import 'colors.dart';

class HalamanSplashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HalamanVerifikasiBerhasil(),
          ),
        );
      });
    });

    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
      ),
    );
  }
}
