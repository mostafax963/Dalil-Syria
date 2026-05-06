import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavoritesLocalDataSource {
  Future<String?> _getUserId() async {
    final user = Supabase.instance.client.auth.currentUser;
    return user?.id;
  }

  Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = await _getUserId();

    if (userId == null) return [];

    return prefs.getStringList("favorites_$userId") ?? [];
  }

  Future<void> toggleFavorite(String tripId) async {
    final prefs = await SharedPreferences.getInstance();
    final userId = await _getUserId();

    if (userId == null) return;

    final key = "favorites_$userId";

    final current = prefs.getStringList(key) ?? [];

    if (current.contains(tripId)) {
      current.remove(tripId);
    } else {
      current.add(tripId);
    }

    await prefs.setStringList(key, current);
  }

  Future<bool> isFavorite(String tripId) async {
    final list = await getFavorites();
    return list.contains(tripId);
  }
}
