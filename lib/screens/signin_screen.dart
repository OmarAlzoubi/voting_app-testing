import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voting_app/screens/signup_screen.dart';
import 'package:voting_app/screens/splash.dart';
import 'package:voting_app/utils/colours.dart';
import 'package:voting_app/widgets/krapi_text_button.dart';
import 'package:voting_app/widgets/krapi_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: backGroundColour,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Text(
                    "Sign in",
                    style: iconTextStyle,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SvgPicture.asset('assets/svg/logo_edited.svg'),
              Text('K-Vote', style: logoTextStyle),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: fillColour, borderRadius: BorderRadius.circular(15)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          "Enter your Election ID:",
                          style: labelTextStyle,
                        ),
                      ),
                      const KrapiTextField(
                        hintText: "Election ID",
                        obscureText: false,
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          "Enter your Personal Email:",
                          style: labelTextStyle,
                        ),
                      ),
                      const KrapiTextField(
                        hintText: "E-mail",
                        obscureText: false,
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          "Enter your password:",
                          style: labelTextStyle,
                        ),
                      ),
                      const KrapiTextField(
                        hintText: "Password",
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ]),
              ),
              const SizedBox(height: 10),
              KrapiTextButton(text: "Sign In", onTap: () {}),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignupScreen(),
                    ));
                  },
                  child: Text(
                    "Don't have an account? Sign Up",
                    style: loginSignUpHelpTextStyle,
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
