import 'package:ecommerce_app/pages/login.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  Splash({super.key});

  @override
  Widget build(BuildContext context) {
    // Start the navigation delay as soon as the widget is built
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/market.png", // Path to your image asset
          fit: BoxFit.cover, // Adjust how the image fits in its box
        ),
      ),
    );
  }
}
