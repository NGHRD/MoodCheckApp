import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mood_check/pages/register_page.dart';
import '../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Emailadres',
                border:OutlineInputBorder()
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Wachtwoord',
                border: OutlineInputBorder()
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => {
                      _auth.login(_emailController.text, _passwordController.text)
                      // Navigator.pushReplacement(
                      //     context, MaterialPageRoute(builder: (context) => HomePage()))
                    },
                    child: const Text('Inloggen')
                ),
                ElevatedButton(
                    onPressed: () => {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => RegisterPage()))
                    },
                    child: const Text('Registreren')
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

