
import 'package:expense_manager/constances/colors.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hint;
  final Function onTap;
  final Function onSaved;
  final TextInputType keyboardType;
  CustomTextField({
    @required TextEditingController controller,
    this.title,
    this.hint,
    this.onTap, this.onSaved, this.keyboardType = TextInputType.text,
  }) : controller = controller;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: Color(0xff67727d)),
        ),
        TextFormField(
          controller: controller,
          cursorColor: black,
          keyboardType: keyboardType,
          onTap: onTap,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          onSaved: onSaved,
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: black),
          decoration: InputDecoration(hintText: hint, border: InputBorder.none),
        ),
      ],
    );
  }
}
