import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager {
  static const String key = 'theme_mode';

  // Menyimpan mode gelap/terang di SharedPreferences
  static Future<void> setThemeMode(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, isDarkMode);
  }

  // Mengambil mode gelap/terang dari SharedPreferences
  static Future<bool> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false; // Default ke mode terang (false)
  }
}
