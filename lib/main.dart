import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:studyx/ui/main_page/main_page.dart';
import './theme/theme_service.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:window_manager/window_manager.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //TODO: Flesh out database stuff
  // maybe using rust could work too....
  final database = openDatabase(
    join(await getDatabasesPath(), 'studybase.db'),
    onCreate: (db, version) {
      return db.execute(
        'CRATE TABLE subjects(id INTEGER PRIMARY KEY, name TEXT,teacher TEXT)',
      );
    },
    version: 1,
  );

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
