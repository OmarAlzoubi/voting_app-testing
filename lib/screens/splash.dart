import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voting_app/constants/routes.dart';
import 'package:voting_app/utils/colours.dart';
import 'package:voting_app/widgets/krapi_text_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _getInitialAuthState();
  }

  Future<void> _getInitialAuthState() async {
    try {
      final initialSession = await SupabaseAuth.instance.initialSession;
      // Redirect users to home screen if is already signed in.

      if (initialSession != null) {
        if (!mounted) return;
        Navigator.of(context).pushNamed(
          homeScreenRoute,
        );
      }
    } catch (e) {
      //TODO Handle initial auth state fetch error here
    }
  }

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
                    Navigator.of(context).pushNamed(
                      choseRoleScreenRoute,
                    );
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}
