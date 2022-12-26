import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:voting_app/constants/routes.dart';
import 'package:voting_app/providers/auth/supabase_auth_provider.dart';
import 'package:voting_app/utils/colours.dart';
import 'package:voting_app/widgets/krapi_form_field.dart';
import 'package:voting_app/widgets/krapi_text_button.dart';

import '../role.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key, required this.role});

  final Role role;
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _electionidController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _partyController;
  late final TextEditingController _passwordController;

  Future<void> _signUp() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final name = _nameController.text;
    final electionid = _electionidController.text;
    final mobile = _phoneNumberController.text;
    final party = _partyController.text;

    SupabaseAuthProvider provider = SupabaseAuthProvider();

    await provider.signUp(email: email, password: password, metaData: {
      "email": email,
      "name": name,
      "electionid": electionid,
      "mobile": mobile,
      "role": EnumToString.convertToString(widget.role),
      "party": party,
    });
  }

  @override
  void initState() {
    _nameController = TextEditingController();
    _electionidController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _partyController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _electionidController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _partyController.dispose();
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
                      KrapiFormFiled(
                        upperLabel: "Enter your full name",
                        hintText: "Full Name",
                        obscureText: false,
                        controller: _nameController,
                      ),
                      KrapiFormFiled(
                        upperLabel: "Enter your election ID",
                        hintText: "Election ID",
                        obscureText: false,
                        controller: _electionidController,
                      ),
                      KrapiFormFiled(
                        upperLabel: "Enter your personal Email",
                        hintText: "E-mail",
                        obscureText: false,
                        controller: _emailController,
                      ),
                      KrapiFormFiled(
                        upperLabel: "Enter your mobile number",
                        hintText: "Mobile Number",
                        obscureText: false,
                        controller: _phoneNumberController,
                      ),
                      Visibility(
                        visible: widget.role == Role.candidate,
                        child: KrapiFormFiled(
                          upperLabel: "Enter your party",
                          hintText: "Party",
                          obscureText: false,
                          controller: _partyController,
                        ),
                      ),
                      KrapiFormFiled(
                        upperLabel: "Enter your password",
                        hintText: "Password",
                        obscureText: true,
                        controller: _passwordController,
                      ),
                      KrapiFormFiled(
                        upperLabel: "Confirm your password",
                        hintText: "Confirm Password",
                        obscureText: true,
                        controller: _passwordController,
                      ),
                    ]),
              ),
              const SizedBox(height: 10),
              KrapiTextButton(
                  text: "Sign Up",
                  onTap: () async {
                    //TODO Validate all fields before signing up (use Form).

                    await _signUp();

                    if (!mounted) return;

                    Navigator.of(context).pushNamed(
                      homeScreenRoute,
                    );
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}
