import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
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
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchUserInfo();
  }

  Future<void> fetchUserInfo() async {
    final response = await http.get(Uri.parse('https://example.com/api/userinfo')); // Replace with your API endpoint

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        username = data['username'];
        email = data['email'];
        name = data['name'];
        birthdate = data['birthdate'];
        gender = data['gender'];
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  void logout() {
    Navigator.pop(context);
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
              : Column(
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
                width: 400,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildInfoField('Naam', name),
                    const Divider(color: Colors.black),
                    buildInfoField('Geboortedatum', birthdate),
                    const Divider(color: Colors.black),
                    buildInfoField('Geslacht', gender),
                    const Divider(color: Colors.black),
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
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomeSubAccountPage(),
  ));
}
