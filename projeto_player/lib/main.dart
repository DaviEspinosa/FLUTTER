import 'package:flutter/material.dart';
import 'package:projeto_player/screen/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Application",
      home: HomeScreen()
    );
  }
}
  