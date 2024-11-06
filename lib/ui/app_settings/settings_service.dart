import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {
  SettingsService._();

  static late SharedPreferencesWithCache userPrefs;
  static SettingsService? _instance;

  static Future<SettingsService> get instance async {
    if (_instance == null) {
      userPrefs = await SharedPreferencesWithCache.create(
          cacheOptions: const SharedPreferencesWithCacheOptions());
      _instance = SettingsService._();
    }
    return _instance!;
  }

  String getOption(name) {
    String? value = userPrefs.getString(name);
    return value;
  }
}
