import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mood_check/pages/login_page.dart';
import 'package:mood_check/services/auth_service.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'EmailAdres'
              )
            ),
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                labelText: 'Voornaam'
              )
            ),
            TextField(
              controller: _prefixController,
              decoration: const InputDecoration(
                labelText: 'Tussenvoegsel',
              ),
            ),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                labelText: 'Achternaam',
              ),
            ),
            TextField(
              controller: _birthdateController,
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000),
                    firstDate:DateTime(1900),
                    lastDate: DateTime(DateTime.now().year - 18)
                );
                if(pickedDate != null ){
                  setState(() {
                    _birthdateController.text = DateFormat('yyyy-dd-MM').format(pickedDate);; //set foratted date to TextField value.
                  });
                }
              },
              decoration: const InputDecoration(
                  labelText: 'Geboortedatum'
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Wachtwoord'
              ),
            ),
            TextField(
              controller: _passwordCheckController,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: 'Wachtwoord herhaling'
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => LoginPage()))
                    },
                    child: const Text('Terug')
                ),
                ElevatedButton(
                    onPressed: () => {
                      _auth.register(
                          _emailController.text,
                          _firstNameController.text,
                          _prefixController.text,
                          _lastNameController.text,
                          _birthdateController.text,
                          _passwordController.text
                      )
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
