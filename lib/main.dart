import 'package:flutter/material.dart';
import 'package:mini_proyecto_01/src/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mini Proyecto 1',
        home: SplashScreen());
  }
}