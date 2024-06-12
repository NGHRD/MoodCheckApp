import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
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
        color: const Color(0XFFD6CDC8),
        child: GNav(
          onTabChange: (index) {
            _navigateBottomBar(index);
          },
          backgroundColor: const Color(0XFFD6CDC8),
          color: Colors.black,
          activeColor: Colors.black,
          tabBackgroundColor: const Color(0XFFFFB99C),
          iconSize: 35,
          tabs: [
            GButton(
              borderRadius: BorderRadius.circular(0.0),
              icon: Icons.calendar_month_outlined,
            ),
            GButton(
              borderRadius: BorderRadius.circular(0.0),
              icon: Icons.ssid_chart_rounded,
            ),
            GButton(
                borderRadius: BorderRadius.circular(0.0),
                icon: Icons.phone_in_talk_rounded,
            ),
            GButton(
                borderRadius: BorderRadius.circular(0.0),
                icon: Icons.account_circle_rounded,
            )
          ],
        ),
      ),
    );
  }
}
