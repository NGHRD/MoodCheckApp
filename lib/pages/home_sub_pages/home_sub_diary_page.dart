import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeSubDiaryPage extends StatefulWidget {
  const HomeSubDiaryPage({super.key});

  @override
  State<HomeSubDiaryPage> createState() => _HomeSubDiaryPageState();
}

class _HomeSubDiaryPageState extends State<HomeSubDiaryPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0XFFF5F0ED),
      body: Center(
        child: Text('Dagboek pagina'),
      ),
    );
  }
}
