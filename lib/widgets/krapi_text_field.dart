import 'package:flutter/material.dart';

class KrapiTextField extends StatelessWidget {
  final String upperLabel;
  final TextStyle labelTextStyle;
  final TextField textField;

  const KrapiTextField(
      {super.key,
      required this.upperLabel,
      required this.textField,
      required this.labelTextStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            upperLabel,
            style: labelTextStyle,
          ),
        ),
        textField
      ],
    );
  }
}
