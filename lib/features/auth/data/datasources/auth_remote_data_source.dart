import 'package:dalil_syria/core/errors/exceptions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide AuthException;

class AuthRemoteDataSource {
  final supabase = Supabase.instance.client;

  Future<void> login({required String email, required String password}) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw AuthException("فشل تسجيل الدخول");
      }
    } on AuthException {
      rethrow;
    } catch (e) {
      throw AuthException("Email or password incorrect".tr());
    }
  }

  bool isLoggedIn() {
    return supabase.auth.currentUser != null;
  }
}
