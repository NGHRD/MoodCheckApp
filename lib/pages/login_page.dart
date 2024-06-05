import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mood_check/components/my_button.dart';
import 'package:mood_check/components/my_textfield.dart';
import 'package:mood_check/pages/register_page.dart';
import '../services/auth_service.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _auth = AuthService();

  void signUserIn() {
    _auth.login(_emailController.text, _passwordController.text);
    Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => HomePage())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyTextfield(
                controller: _emailController,
                hintText: 'Emailadres',
                obscureText: false,
                readOnly: false,
            ),
            const SizedBox(height: 10),
            MyTextfield(
                controller: _passwordController,
                hintText: 'Wachtwoord',
                obscureText: true,
                readOnly: false,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Wachtwoord vergeten?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ]
              ),
            ),
            const SizedBox(height: 40),
            MyButton(
              text: 'Login',
              onTab: signUserIn,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Nog geen account?',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () => {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => RegisterPage()))
                  },
                  child: const Text(
                    'Registreer nu',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
  }
}

