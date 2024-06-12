import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mood_check/components/my_button.dart';
import 'package:mood_check/components/my_textfield.dart';
import '../../services/auth_service.dart';
import '../home_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({super.key, required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _auth = AuthService();


  void signUserIn() {
    _auth.login(_emailController.text, _passwordController.text);
    Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => HomePage())
    );
  }

  @override
  Widget build(BuildContext context) {
    final keyboardActive = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (!keyboardActive) Image.asset("assets/images/moodcheck_logo.png"),
            const SizedBox(height: 20.0),
            Text(
                "MindCheck",
                style: GoogleFonts.inika(
                    fontSize: 45,
                    fontWeight: FontWeight.bold
                )
            ),
            Text(
                "login",
                style: GoogleFonts.inika(
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                )
            ),
            const SizedBox(height: 40.0),
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
                      style: GoogleFonts.inika(color: Colors.grey[600]),
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
                  style: GoogleFonts.inika(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                 onTap: widget.showRegisterPage,
                  child: Text(
                    'Registreer nu',
                    style: GoogleFonts.inika(
                        color: Color(0XFF3D7593),
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

