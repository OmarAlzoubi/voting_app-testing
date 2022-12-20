import 'package:flutter/material.dart';
import 'package:voting_app/screens/splash.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "K-Vote",
      home: SplashScreen(),
    );
  }
}
