import 'package:dalil_syria/core/config/app_constants.dart';
import 'package:dalil_syria/core/errors/exceptions.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:supabase_flutter/supabase_flutter.dart' hide AuthException;

class ProfileRemoteDataSource {
  final supabase = Supabase.instance.client;

  Future<Map<String, dynamic>> getProfile() async {
    try {
      final user = supabase.auth.currentUser;

      if (user == null) {
        throw ServerException("profile_not_logged_in".tr());
      }

      final data = await supabase
          .from(AppConstants.profilesTable)
          .select()
          .eq('id', user.id)
          .maybeSingle();

      return {"user": user, "profile": data};
    } on PostgrestException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      if (e is ServerException) rethrow;

      throw ServerException("profile_error".tr());
    }
  }

  Future<void> logout() async {
    try {
      await supabase.auth.signOut();
    } on AuthException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException("profile_logout_error".tr());
    }
  }
}
