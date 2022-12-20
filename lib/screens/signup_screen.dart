import 'package:flutter/material.dart';
import 'package:voting_app/screens/signin_screen.dart';
import 'package:voting_app/screens/splash.dart';
import 'package:voting_app/utils/colours.dart';
import 'package:voting_app/widgets/krapi_text_button.dart';
import 'package:voting_app/widgets/krapi_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        "Sign Up",
                        style: iconTextStyle,
                      ),
                    ],
                  ),
                  Text(
                    // TODO This should be a button with on-click callback
                    "Help",
                    style: iconTextStyle,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: fillColour, borderRadius: BorderRadius.circular(15)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          "Enter your full name:",
                          style: labelTextStyle,
                        ),
                      ),
                      const KrapiTextField(
                        hintText: "Full Name",
                        obscureText: false,
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          "Enter your election ID:",
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
                          "Enter your personal email:",
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
                          "Enter your mobile number:",
                          style: labelTextStyle,
                        ),
                      ),
                      const KrapiTextField(
                        hintText: "Mobile Number",
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
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          "Confirm your password:",
                          style: labelTextStyle,
                        ),
                      ),
                      const KrapiTextField(
                        hintText: "Confirm Password",
                        obscureText: true,
                      ),
                    ]),
              ),
              const SizedBox(height: 10),
              KrapiTextButton(text: "Sign Up", onTap: () {}),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ));
                  },
                  child: Text(
                    "Already a member? Sign in",
                    style: loginSignUpHelpTextStyle,
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
