import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voting_app/constants/routes.dart';
import 'package:voting_app/providers/auth/supabase_auth_provider.dart';
import 'package:voting_app/constants/colours.dart';
import 'package:voting_app/widgets/krapi_text_button.dart';
import 'package:voting_app/widgets/krapi_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController _electionidController;
  late final TextEditingController _passwordController;

  Future<void> _signIn() async {
    final email = _electionidController.text;
    final password = _passwordController.text;

    SupabaseAuthProvider provider = SupabaseAuthProvider();

    await provider.signIn(electionid: email, password: password);
  }

  @override
  void initState() {
    _electionidController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _electionidController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: backGroundColour,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
                  color: fillColour1, borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KrapiTextField(
                      upperLabel: "Enter your Election ID",
                      labelTextStyle: labelTextStyle1,
                      textField: TextField(
                        obscureText: false,
                        controller: _electionidController,
                        enabled: true,
                        decoration: InputDecoration(
                          fillColor: backGroundColour,
                          hintText: "Election ID",
                          hintStyle: hintTextStyle1,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    KrapiTextField(
                        upperLabel: "Enter your password",
                        labelTextStyle: labelTextStyle1,
                        textField: TextField(
                            obscureText: true,
                            controller: _passwordController,
                            enabled: true,
                            decoration: InputDecoration(
                              fillColor: backGroundColour,
                              hintText: "Password",
                              hintStyle: hintTextStyle1,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ))),
                  ]),
            ),
            const SizedBox(height: 10),
            KrapiTextButton(
                width: 400,
                text: "Sign In",
                onTap: () async {
                  await _signIn();

                  if (!mounted) return;

                  Navigator.of(context).pushNamed(
                    homeScreenRoute,
                  );
                }),
          ],
        ),
      ),
    ));
  }
}
