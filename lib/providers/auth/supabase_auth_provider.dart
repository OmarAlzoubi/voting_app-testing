import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthProvider {
  Future<void> signIn({required String email, required String password}) async {
    final response = await Supabase.instance.client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    final userId = response.user?.id;

    if (userId == null) {
      throw UnimplementedError("Supabase SignUp");
    }
  }

  Future<void> signUp(
      {required String email,
      required String password,
      required Map<String, dynamic> metaData}) async {
    final response = await Supabase.instance.client.auth.signUp(
      email: email,
      password: password,
      data: metaData,
    );

    final userId = response.user?.id;

    if (userId == null) {
      throw UnimplementedError("Supabase SignUp");
    }
  }

  Future<void> signOut() async {
    await Supabase.instance.client.auth.signOut();
  }
}
