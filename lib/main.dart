import 'package:flutter/material.dart';
import 'package:skillswedstrijd/pages/homepage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Manier',
      ),
      home: const Homepage(),
    );
  }
}
