import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRadioListTile extends StatelessWidget {
  final String text;
  final value;
  final groupValue;
  final Function onChanged;

  const MyRadioListTile({
    super.key,
    required this.text,
    required this.value,
    required this.groupValue,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: RadioListTile(
          activeColor: const Color(0XFFFFB99C),
          title: Text(text),
          value: value,
          groupValue: groupValue,
          onChanged: (value) {
            onChanged(value);
          }
      ),
    );
  }
}
