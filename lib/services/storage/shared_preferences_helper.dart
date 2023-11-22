import 'package:moomalpublication/services/storage/shared_preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  SharedPreferencesHelper._();

  static late SharedPreferences _preferences;

  /// Initialization
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /// Check key's availability
  static Future<bool> containsKey(String key) async {
    return _preferences.containsKey(key);
  }

  /// Delete
  static Future<bool> remove(String key) async {
    return _preferences.remove(key);
  }

  /// Delete All
  static Future<bool> clearSharedPref() async {
    final String? serverClientId = await SharedPreferencesHelper.getString(
      SharedPreferenceKeys.serverClientId,
    );
    if (await _preferences.clear() == false) {
      return false;
    }
    await _preferences.clear();
    await SharedPreferencesHelper.setValue(
      SharedPreferenceKeys.serverClientId,
      serverClientId,
    );

    return true;
  }

  /// Getters
  static Future<dynamic> getValue(String key) async {
    return _preferences.get(key);
  }

  static Future<bool> getBool(String key) async {
    return _preferences.getBool(key) ?? false;
  }

  static Future<int> getInt(String key) async {
    return _preferences.getInt(key) ?? 0;
  }

  static Future<double> getDouble(String key) async {
    return _preferences.getDouble(key) ?? 0.0;
  }

  static Future<String?> getString(String key) async {
    return _preferences.getString(key) ?? "";
  }

  static Future<List<String>?> getStringList(String key) async {
    return _preferences.getStringList(key);
  }

  /// Setters
  static Future<void> setValue(String key, dynamic value) async {
    if (value is bool) {
      await _preferences.setBool(key, value);
    } else if (value is int) {
      await _preferences.setInt(key, value);
    } else if (value is double) {
      await _preferences.setDouble(key, value);
    } else if (value is String) {
      await _preferences.setString(key, value);
    } else if (value is List<String>) {
      await _preferences.setStringList(key, value);
    }
  }
}
