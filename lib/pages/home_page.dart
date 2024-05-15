import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mood_check/pages/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Home pagina'),
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
