import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mood_check/pages/auth_pages/login_page.dart';
import 'dart:convert';

class HomeSubAccountPage extends StatefulWidget {
  const HomeSubAccountPage({super.key});

  @override
  HomeSubAccountPageState createState() => HomeSubAccountPageState();
}

class HomeSubAccountPageState extends State<HomeSubAccountPage> {
  String username = '';
  String email = '';
  String name = '';
  String birthdate = '';
  String gender = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserInfo();
  }

  Future<void> fetchUserInfo() async {
    final box = GetStorage();

    username = box.read('username');
    email = box.read('email');

    if (isLoading = true) {
      setState(() {
        username = box.read('username');
        email = box.read('email');
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  void logout() {
    final box = GetStorage();
    box.remove('username');
    box.remove('email');
    box.remove('token');

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage(showRegisterPage: () {})),
    );

  }

  Widget buildInfoField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        '$label: $value',
        style: GoogleFonts.inika(
          fontSize: 18,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F0ED),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD6CDC8),
        title: Center(
          child: Text(
            "Moodcheck",
            style: GoogleFonts.inika(
                fontSize: 20
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey.shade300,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildInfoField('Gebruikersnaam', username),
                      const Divider(color: Colors.black),
                      buildInfoField('E-mail', email),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: logout,
                  child: const Text('Uitloggen'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomeSubAccountPage(),
  ));
}
