import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

final notificationToggleProvider =
    StateNotifierProvider<NotificationToggleNotifier, bool>((ref) {
      return NotificationToggleNotifier();
    });

class NotificationToggleNotifier extends StateNotifier<bool> {
  NotificationToggleNotifier() : super(true) {
    load();
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool("notifications_enabled") ?? true;
  }

  Future<void> toggle(bool value) async {
    state = value;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("notifications_enabled", value);
  }
}
