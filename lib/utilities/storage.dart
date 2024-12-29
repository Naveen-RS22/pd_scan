import 'package:shared_preferences/shared_preferences.dart';

class QStorage {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  static Future<bool> clearStorage() async {
    final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    final p = await prefs;
    return p.clear();
  }

  Future<bool> getBool(String key) async {
    final p = await prefs;
    return p.getBool(key) ?? false;
  }

  Future setBool(String key, bool value) async {
    final p = await prefs;
    return p.setBool(key, value);
  }

  Future<int> getInt(String key) async {
    final p = await prefs;
    return p.getInt(key) ?? 0;
  }

  Future setInt(String key, int value) async {
    final p = await prefs;
    return p.setInt(key, value);
  }

  Future<String> getString(String key) async {
    final p = await prefs;
    return p.getString(key) ?? '';
  }

  Future setString(String key, String value) async {
    final p = await prefs;
    return p.setString(key, value);
  }
}
