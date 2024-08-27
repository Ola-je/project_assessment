import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project_assessment/presentation/pages/home_page.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [

          Image.asset(
            'assets/images/splash.png',
            fit: BoxFit.cover,
          ),

          const Positioned(
            bottom: 90, 
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Welcome to', 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const Positioned(
            bottom: 30, 
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'SPEEDY CHOW', 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
