import 'package:escape/screens/auth-screen.dart';
import 'package:escape/screens/home-screen_main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Home(),
      home: AuthScreen()
    );
  }
}
