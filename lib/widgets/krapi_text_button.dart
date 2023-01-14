import 'package:flutter/material.dart';
import 'package:voting_app/constants/colours.dart';

class KrapiTextButton extends StatelessWidget {
  final String text;
  final double? width;
  final VoidCallback? onTap;
  const KrapiTextButton(
      {super.key, required this.text, required this.onTap, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 60,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          foregroundColor: buttonTextColour,
          backgroundColor: fillColour1,
          textStyle: buttonTextStyle,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: buttonTextStyle,
        ),
      ),
    );
  }
}
