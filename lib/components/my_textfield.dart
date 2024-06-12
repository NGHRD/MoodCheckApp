import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextfield extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText, readOnly;
  final void Function()? onTab;

  const MyTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.readOnly,
    required this.obscureText,
    this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        onTap: onTab,
        readOnly: readOnly,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFD6CDC8)),
                borderRadius: BorderRadius.circular(30.0)
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0XFF3D7593)),
                borderRadius: BorderRadius.circular(30.0)
            ),
            filled: true,
            fillColor: Colors.grey.shade200,
            hintText: hintText,
          hintStyle: GoogleFonts.inika(
            color: Colors.grey[500]
          )
        ),
      ),
    );
  }
}
