import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mood_check/components/my_textfield.dart';
import 'package:mood_check/services/auth_service.dart';

import '../../components/my_button.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _prefixController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordCheckController = TextEditingController();

  final _auth = AuthService();
  bool _passwordNotEqual = false;

  void openCalender() async{
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime(2000),
        firstDate:DateTime(1900),
        lastDate: DateTime(DateTime.now().year - 18)
    );
    if(pickedDate != null ){
      setState(() {
        _birthdateController.text = DateFormat('yyyy-dd-MM').format(pickedDate);//set foratted date to TextField value.
      });
    }
  }

  void registerUser() {
    if(_passwordController.text == _passwordCheckController.text) {
      _auth.register(
          _emailController.text,
          _firstNameController.text,
          _prefixController.text,
          _lastNameController.text,
          _birthdateController.text,
          _passwordController.text
      );
    } else {
      setState(() {
        _passwordNotEqual = true;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _prefixController.dispose();
    _lastNameController.dispose();
    _birthdateController.dispose();
    _passwordController.dispose();
    _passwordCheckController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardActive = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (!keyboardActive) Text(
                "Registreren",
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
              controller: _firstNameController,
              hintText: 'Voornaam',
              obscureText: false,
              readOnly: false,
            ),
            const SizedBox(height: 10),
            MyTextfield(
              controller: _lastNameController,
              hintText: 'Achternaam',
              obscureText: false,
              readOnly: false,
            ),
            const SizedBox(height: 10),
            MyTextfield(
              controller: _birthdateController,
              readOnly: true,
              hintText: 'Geboortedatum',
                onTab: openCalender,
              obscureText: false,
            ),
            const SizedBox(height: 10),
            MyTextfield(
              controller: _passwordController,
              hintText: 'Wachtwoord',
              obscureText: true,
              readOnly: false,
            ),
            const SizedBox(height: 10),
            MyTextfield(
              controller: _passwordCheckController,
              obscureText: true,
              hintText: 'Herhaal wachtwoord',
              readOnly: false,
            ),
            const SizedBox(height: 10),
            if(_passwordNotEqual) Text(
                'Wachtwoorden komen niet overeen',
              style: GoogleFonts.inika(
                color: Colors.red
              ),
            ),
            const SizedBox(height: 30),
            MyButton(
              text: 'Registreren',
              onTab: registerUser,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Heb je een account?',
                  style: GoogleFonts.inika(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: widget.showLoginPage,
                  child: Text(
                    'Inloggen',
                    style: GoogleFonts.inika(
                        color: const Color(0XFF3D7593),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
