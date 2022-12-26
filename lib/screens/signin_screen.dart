import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:voting_app/constants/routes.dart';
import 'package:voting_app/providers/auth/supabase_auth_provider.dart';
import 'package:voting_app/utils/colours.dart';
import 'package:voting_app/widgets/krapi_form_field.dart';
import 'package:voting_app/widgets/krapi_text_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  Future<void> _signIn() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    SupabaseAuthProvider provider = SupabaseAuthProvider();

    await provider.signIn(email: email, password: password);
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
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
                      KrapiFormFiled(
                        upperLabel: "Enter your personal Email",
                        hintText: "E-mail",
                        obscureText: false,
                        controller: _emailController,
                      ),
                      KrapiFormFiled(
                          upperLabel: "Enter your password",
                          hintText: "Password",
                          obscureText: true,
                          controller: _passwordController),
                    ]),
              ),
              const SizedBox(height: 10),
              KrapiTextButton(
                  text: "Sign In",
                  onTap: () async {
                    await _signIn();

                    if (!mounted) return;

                    Navigator.of(context).pushNamed(
                      homeScreenRoute,
                    );
                  }),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      choseRoleScreenRoute,
                    );
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
