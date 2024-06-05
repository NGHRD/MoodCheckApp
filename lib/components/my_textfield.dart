import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)
            ),
            filled: true,
            fillColor: Colors.grey.shade200,
            hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[500]
          )
        ),
      ),
    );
  }
}
