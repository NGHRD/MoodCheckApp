import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeSubHelpPage extends StatefulWidget {
  const HomeSubHelpPage({super.key});

  @override
  State<HomeSubHelpPage> createState() => _HomeSubHelpPageState();
}

class _HomeSubHelpPageState extends State<HomeSubHelpPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Directe hulp pagina')
      ),
    );
  }
}
