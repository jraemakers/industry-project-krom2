import 'package:flutter/material.dart';
import 'package:escape/screens/auth-screen.dart';
import 'package:escape/screens/mohammed.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => AuthScreen(),
        '/mohammed': (context) => Mohammed(),
      },
    );
  }
}
