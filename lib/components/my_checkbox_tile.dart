import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCheckboxTile extends StatelessWidget {
  final String text;
  final bool value;
  final Function onChanged;

  const MyCheckboxTile({
    required this.text,
    required this.value,
    required this.onChanged,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: CheckboxListTile(
        activeColor:  const Color(0XFFFFB99C),
        title: Text(text),
        value: value,
        onChanged: (value) {
          onChanged(value);
        }
      ),
    );
  }
}
