import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:studyx/ui/dashboard/dashboard.dart';

void main() {
  runApp(const MyApp());
  windowManager.waitUntilReadyToShow().then((_) async {
    await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
  });
}

var currentTheme = ThemeData.dark(useMaterial3: true);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Studyx',
      theme: currentTheme,
      home: const Dashboard(),
    );
  }
}