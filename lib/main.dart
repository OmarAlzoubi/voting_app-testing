import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voting_app/constants/env.dart';
import 'package:voting_app/constants/routes.dart';
import 'package:voting_app/screens/candidates_list_screen.dart';
import 'package:voting_app/screens/home_screen.dart';
import 'package:voting_app/screens/signin_screen.dart';
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
      home: CandidatesListScreen(),
    );
  }
}
