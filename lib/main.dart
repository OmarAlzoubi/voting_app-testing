import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voting_app/constants/env.dart';
import 'package:voting_app/constants/routes.dart';
import 'package:voting_app/role.dart';
import 'package:voting_app/screens/chose_role_screen.dart';
import 'package:voting_app/screens/home_screen.dart';
import 'package:voting_app/screens/signin_screen.dart';
import 'package:voting_app/screens/signup_screen.dart';
import 'package:voting_app/screens/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: supabaseURL,
    anonKey: anonKey,
    debug: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "K-Vote",
        initialRoute: '/',
        onGenerateRoute: (settings) {
          if (settings.name == signUpScreenRoute) {
            final argument = settings.arguments as Role;
            return MaterialPageRoute(
                builder: (context) => SignupScreen(role: argument));
          } else {
            return null;
            //TODO Read more on onGenerateRoute.
          }
        },
        routes: {
          splashScreenRoute: (context) => const SplashScreen(),
          choseRoleScreenRoute: (context) => const ChoseRoleScreen(),
          signInScreenRoute: (context) => const SignInScreen(),
          homeScreenRoute: (context) => const HomeScreen(),
        });
  }
}
