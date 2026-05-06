import 'package:dalil_syria/core/services/session_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sessionServiceProvider = Provider<SessionService>((ref) {
  final prefs = ref.read(sharedPrefsProvider);
  return SessionService(prefs);
});
