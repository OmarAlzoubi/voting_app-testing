import 'package:flutter/material.dart';
import 'package:voting_app/utils/colours.dart';

class KrapiTextField extends StatelessWidget {
  const KrapiTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
  });

  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: backGroundColour,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
          hintStyle: hintTextStyle,
        ),
        obscureText: obscureText,
      ),
    );
  }
}
