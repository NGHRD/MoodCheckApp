import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mood_check/pages/home_sub_pages/home_sub_account_page.dart';
import 'package:mood_check/pages/home_sub_pages/home_sub_diagnose_page.dart';
import 'package:mood_check/pages/home_sub_pages/home_sub_diary_page.dart';
import 'package:mood_check/pages/home_sub_pages/home_sub_help_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomeSubDiagnosePage(),
    HomeSubDiaryPage(),
    HomeSubHelpPage(),
    HomeSubAccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container (
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: GNav(
            onTabChange: (index) {
              _navigateBottomBar(index);
            },
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            tabs: const [
              GButton(
                padding: EdgeInsets.all(12.0),
                icon: Icons.monitor_heart_rounded,
                text: 'Home',
              ),
              GButton(
                padding: EdgeInsets.all(12.0),
                icon: Icons.date_range_outlined,
                text: 'Dagboek',
              ),
              GButton(
                  padding: EdgeInsets.all(12.0),
                  icon: Icons.warning_amber_rounded,
                  text: 'Direct hulp'
              ),
              GButton(
                  padding: EdgeInsets.all(12.0),
                  icon: Icons.account_circle_outlined,
                  text: 'Account'
              )
            ],
          ),
        ),
      ),
    );
  }
}
