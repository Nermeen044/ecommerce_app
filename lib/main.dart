import 'package:ecommerce_app/pages/login.dart';
import 'package:ecommerce_app/pages/signup.dart';
import 'package:ecommerce_app/pages/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      // home: Splash(),
      initialRoute: "Splash",

      routes: {
        "Splash": (context) => Splash(),
        "Login": (context) => const Login(),
        "Signup": (context) => const Signup(),
      },
    );
  }
}
