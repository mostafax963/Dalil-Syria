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
        throw AuthException("Login failed");
      }
    } on AuthException {
      rethrow;
    } catch (_) {
      throw AuthException("Email or password incorrect".tr());
    }
  }

  Future<void> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      final user = response.user;

      if (user == null) {
        throw AuthException("Registration failed");
      }

      await supabase.from('profiles').insert({
        'id': user.id,
        'full_name': fullName,
        'phone': phone,
      });
    } on AuthException {
      rethrow;
    } on PostgrestException catch (e) {
      throw AuthException(e.message);
    } on AuthApiException catch (e) {
      switch (e.code) {
        case "email_exists":
          throw AuthException("register_email_exists".tr());

        case "weak_password":
          throw AuthException("register_password_weak".tr());

        case "invalid_credentials":
          throw AuthException("register_invalid_credentials".tr());

        default:
          throw AuthException(e.message);
      }
    }
  }

  bool isLoggedIn() {
    return supabase.auth.currentUser != null;
  }
}
