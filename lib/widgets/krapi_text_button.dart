import 'package:flutter/material.dart';
import 'package:voting_app/utils/colours.dart';

class KrapiTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  const KrapiTextButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 60,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          foregroundColor: buttonTextColour,
          backgroundColor: fillColour,
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
