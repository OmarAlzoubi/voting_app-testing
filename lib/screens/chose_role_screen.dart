import 'package:flutter/material.dart';
import 'package:voting_app/constants/routes.dart';
import 'package:voting_app/role.dart';
import 'package:voting_app/utils/colours.dart';
import 'package:voting_app/widgets/krapi_text_button.dart';

class ChoseRoleScreen extends StatelessWidget {
  const ChoseRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColour,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KrapiTextButton(
                  text: "Sign Up as a candidate",
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      signUpScreenRoute,
                      arguments: Role.candidate,
                    );
                  }),
              const SizedBox(height: 20),
              KrapiTextButton(
                  text: "Sign Up as a voter",
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      signUpScreenRoute,
                      arguments: Role.voter,
                    );
                  }),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      signInScreenRoute,
                    );
                  },
                  child: Text(
                    "Already a member? Sign in",
                    style: loginSignUpHelpTextStyle,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
