import 'package:flutter/material.dart';
import 'package:mood_check/pages/auth_pages/auth_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mood Check',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFD6CDC8),
        useMaterial3: true,
      ),
      home: const AuthPage(),
    );
  }
}