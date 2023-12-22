import 'package:shared_preferences/shared_preferences.dart';

final class Prefs {
  static const _isWasStarted = 'is_was_started';

  static Future<bool> isWasStarted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isWasStarted) == true;
  }

  static void setWasStarted(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(_isWasStarted, value);
  }
}
