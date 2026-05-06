import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  final SharedPreferences prefs;

  SessionService(this.prefs);

  static const _firstTimeKey = "first_time";

  bool isFirstTime() {
    return prefs.getBool(_firstTimeKey) ?? true;
  }

  void completeOnboarding() {
    prefs.setBool(_firstTimeKey, false);
  }
}
