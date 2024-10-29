import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './themes.dart';

class ThemeService {
  ThemeService._();
  static late SharedPreferencesWithCache userPrefs;
  static ThemeService? _instance;

  static Future<ThemeService> get instance async {
    if (_instance == null) {
      userPrefs = await SharedPreferencesWithCache.create(
        cacheOptions: const SharedPreferencesWithCacheOptions(),
      );
      _instance = ThemeService._();
    }
    return _instance!;
  }

  final themes = <String, ThemeData>{
    'dark': darkTheme,
    'light': lightTheme,
  };

  String get previousThemeName {
    String? themeName = userPrefs.getString('previousTheme');
    if (themeName == null) {
      final isPlatformDark =
          WidgetsBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark;
      themeName = isPlatformDark ? 'light' : 'dark';
    }
    return themeName;
  }

  String get currentThemeName {
    String? themeName = userPrefs.getString('theme');
    return themeName!;
  }

  get initial {
    String? themeName = userPrefs.getString('theme');
    if (themeName == null) {
      final isPlatformDark =
          WidgetsBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark;
      themeName = isPlatformDark ? 'dark' : 'light';
    }
    return themes[themeName];
  }

  save(newTheme) {
    var currentTheme = userPrefs.getString('theme');
    if (currentTheme != null) {
      userPrefs.setString('previousTheme', currentTheme);
    }
    userPrefs.setString('theme', newTheme);
  }

  ThemeData getByName(String name) {
    return themes[name]!;
  }
}
