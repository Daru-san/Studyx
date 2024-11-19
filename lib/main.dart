import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:studyx/models/database/database_helper.dart';
import 'package:studyx/ui/main_page/main_page.dart';
import './theme/theme_service.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:window_manager/window_manager.dart';

DatabaseHelper appDatabase = DatabaseHelper();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  appDatabase.initializeDatabase();

  final themeService = await ThemeService.instance;

  var initTheme = themeService.initial;

  runApp(
    StudyxApp(theme: initTheme),
  );

  if (Platform.isLinux) {
    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
    });
  }
}

class StudyxApp extends StatelessWidget {
  const StudyxApp({
    super.key,
    required this.theme,
  });
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: theme,
      builder: (_, theme) {
        return MaterialApp(
          title: 'Studyx',
          theme: theme,
          home: const MainPage(),
        );
      },
    );
  }
}
