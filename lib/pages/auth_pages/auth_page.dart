import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mood_check/pages/auth_pages/register_page.dart';
import 'package:mood_check/pages/home_page.dart';

import 'login_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}


class _AuthPageState extends State<AuthPage> {
  final box = GetStorage();
  bool showLoginPage = true;

  @override
  void initState() {
    box.erase();
    super.initState();
  }

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(box.read('token') != null) {
      return HomePage();
    } else {
      if(showLoginPage) {
        return LoginPage(showRegisterPage: toggleScreens);
      } else {
        return RegisterPage(showLoginPage: toggleScreens);
      }
    }
  }
}
