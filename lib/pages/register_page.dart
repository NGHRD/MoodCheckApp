import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mood_check/components/my_textfield.dart';
import 'package:mood_check/pages/login_page.dart';
import 'package:mood_check/services/auth_service.dart';

import '../components/my_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _prefixController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _birthdateController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordCheckController = TextEditingController();

  final _auth = AuthService();

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
    _auth.register(
      _emailController.text,
      _firstNameController.text,
      _prefixController.text,
      _lastNameController.text,
      _birthdateController.text,
      _passwordController.text
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyTextfield(
              controller: _emailController,
              hintText: 'Emailadres',
              obscureText: false,
              readOnly: false,
            ),
            SizedBox(height: 10),
            MyTextfield(
              controller: _firstNameController,
              hintText: 'Voornaam',
              obscureText: false,
              readOnly: false,
            ),
            SizedBox(height: 10),
            MyTextfield(
              controller: _lastNameController,
              hintText: 'Achternaam',
              obscureText: false,
              readOnly: false,
            ),
            SizedBox(height: 10),
            MyTextfield(
              controller: _birthdateController,
              readOnly: true,
              hintText: 'Geboortedatum',
                onTab: openCalender,
              obscureText: false,
            ),
            SizedBox(height: 10),
            MyTextfield(
              controller: _passwordController,
              hintText: 'Wachtwoord',
              obscureText: true,
              readOnly: false,
            ),
            SizedBox(height: 10),
            MyTextfield(
              controller: _passwordCheckController,
              obscureText: true,
              hintText: 'Herhaal wachtwoord',
              readOnly: false,
            ),
            const SizedBox(height: 40),
            MyButton(
              text: 'Login',
              onTab: registerUser,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Heb je een account?',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () => {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => LoginPage()))
                  },
                  child: const Text(
                    'Inloggen',
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
      ),
    );
  }
}
