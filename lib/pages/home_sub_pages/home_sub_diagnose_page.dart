import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login_page.dart';

class HomeSubDiagnosePage extends StatefulWidget {
  const HomeSubDiagnosePage({super.key});

  @override
  State<HomeSubDiagnosePage> createState() => _HomeSubDiagnosePageState();
}

class _HomeSubDiagnosePageState extends State<HomeSubDiagnosePage> {
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
                        context, MaterialPageRoute(builder: (context) => LoginPage()))
                  },
                  child: const Text('Uitloggen')
              )
            ],
          )
      ),
    );
  }
}
