import 'package:dalil_syria/core/errors/exceptions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavoritesLocalDataSource {
  Future<String?> _getUserId() async {
    final user = Supabase.instance.client.auth.currentUser;

    return user?.id;
  }

  Future<List<String>> getFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final userId = await _getUserId();

      if (userId == null) {
        throw CacheException("error_login_required".tr());
      }

      return prefs.getStringList("favorites_$userId") ?? [];
    } catch (e) {
      throw CacheException("error_favorites_load".tr());
    }
  }

  Future<void> toggleFavorite(String tripId) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final userId = await _getUserId();

      if (userId == null) {
        throw CacheException("error_favorites_load".tr());
      }

      final key = "favorites_$userId";

      final current = prefs.getStringList(key) ?? [];

      if (current.contains(tripId)) {
        current.remove(tripId);
      } else {
        current.add(tripId);
      }

      await prefs.setStringList(key, current);
    } catch (e) {
      throw CacheException("error_favorites_update".tr());
    }
  }

  Future<bool> isFavorite(String tripId) async {
    try {
      final list = await getFavorites();

      return list.contains(tripId);
    } catch (e) {
      throw CacheException("error_favorites_check".tr());
    }
  }
}
