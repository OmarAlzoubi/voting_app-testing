import 'package:flutter/cupertino.dart';

import 'package:voting_app/utils/colours.dart';
import 'package:voting_app/widgets/krapi_text_field.dart';

class KrapiFormFiled extends StatelessWidget {
  const KrapiFormFiled({
    Key? key,
    required this.upperLabel,
    required this.hintText,
    required this.obscureText,
    required this.controller,
  }) : super(key: key);

  final String upperLabel;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

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
        KrapiTextField(
            hintText: hintText,
            obscureText: obscureText,
            controller: controller),
        const SizedBox(height: 10),
      ],
    );
  }
}
