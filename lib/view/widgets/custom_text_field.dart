
import 'package:expense_manager/constances/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hint;
  final Function onTap;
  CustomTextField({
    @required TextEditingController controller,
    this.title,
    this.hint,
    this.onTap,
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
        TextField(
          controller: controller,
          cursorColor: black,
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: black),
          decoration: InputDecoration(hintText: hint, border: InputBorder.none),
        ),
      ],
    );
  }
}
