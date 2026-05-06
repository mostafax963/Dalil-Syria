import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteDataSource {
  final supabase = Supabase.instance.client;

  Future<void> login({required String email, required String password}) async {
    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user == null) {
      throw Exception("Login failed");
    }
  }

  Future<void> logout() async {
    await supabase.auth.signOut();
  }

  bool isLoggedIn() {
    return supabase.auth.currentUser != null;
  }
}
