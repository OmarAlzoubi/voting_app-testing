import 'package:flutter/material.dart';

import '../constants/colours.dart';
import 'krapi_text_button.dart';

class CandidateList extends StatelessWidget {
  const CandidateList(
      {super.key,
      required this.profilePic,
      required this.candidateName,
      required this.button1,
      required this.button2});

  final String profilePic;
  final String candidateName;
  final KrapiTextButton button1;
  final KrapiTextButton button2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 100,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(profilePic),
        ),
        Text(
          candidateName,
          style: logoTextStyle,
          textAlign: TextAlign.center,
        ),
        button1,
        const SizedBox(height: 10),
        button2,
        const SizedBox(height: 40)
      ],
    );
  }
}
