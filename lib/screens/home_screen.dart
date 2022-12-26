import 'package:flutter/material.dart';
import 'package:voting_app/constants/routes.dart';
import 'package:voting_app/providers/auth/supabase_auth_provider.dart';
import 'package:voting_app/utils/colours.dart';
import 'package:voting_app/widgets/krapi_text_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColour,
      body: Center(
          child: KrapiTextButton(
        text: "SignOut",
        onTap: () async {
          SupabaseAuthProvider provider = SupabaseAuthProvider();
          await provider.signOut();
          if (!mounted) return;
          Navigator.of(context).pushNamedAndRemoveUntil(
            splashScreenRoute,
            (route) => false,
          );
        },
      )),
    );
  }
}
