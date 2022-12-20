import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voting_app/screens/signup_screen.dart';
import 'package:voting_app/utils/colours.dart';
import 'package:voting_app/widgets/krapi_text_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: backGroundColour,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 120,
            ),
            SvgPicture.asset('assets/svg/logo_edited.svg'),
            Text('K-Vote', style: logoTextStyle),
            const SizedBox(height: 40),
            Text('What is K-Vote?', style: headerTextStyle),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'K- Vote is an elections platform you can use\n to vote securely and remotely from your\n smartphone.',
                style: paragraphTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: KrapiTextButton(
                  text: 'Get Started',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignupScreen(),
                    ));
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}
