import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function() onTab;

  const MyButton({
    super.key,
    required this.text,
    required this.onTab
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: const Color(0XFFA8CD8A),
            borderRadius: BorderRadius.circular(30)
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.inika(
                color: Colors.black45,
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
        ),
      ),
    );
  }
}
