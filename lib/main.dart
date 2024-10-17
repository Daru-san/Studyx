import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:studyx/ui/dashboard/dashboard.dart';
import 'package:studyx/ui/theming/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child:  const StudyxApp(),
    ),
  );
  windowManager.waitUntilReadyToShow().then((_) async {
    await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
  });
}

var currentTheme = ThemeData.dark(useMaterial3: true);

class StudyxApp extends StatelessWidget {
  const StudyxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Studyx',
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const Dashboard(),
    );
  }
}