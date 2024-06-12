import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mood_check/pages/auth_pages/auth_page.dart';

class HomeSubTodayPage extends StatefulWidget {
  const HomeSubTodayPage({super.key});

  @override
  State<HomeSubTodayPage> createState() => _HomeSubDiagnosePageState();
}

class _HomeSubDiagnosePageState extends State<HomeSubTodayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5F0ED),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Diagnose/Home pagina'),
              ElevatedButton(
                  onPressed: () => {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => AuthPage()))
                  },
                  child: const Text('Uitloggen')
              )
            ],
          )
      ),
    );
  }
}
