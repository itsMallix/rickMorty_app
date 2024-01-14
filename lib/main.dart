import 'package:bigio_test/view/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ricky and Morty App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const ScreenSplash(),
    );
  }
}
