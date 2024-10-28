import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:studyx/ui/dashboard/dashboard.dart';
import 'package:studyx/ui/theming/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const StudyxApp(),
    ),
  );

  if (Platform.isLinux) {
    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
    });
  }
}

class StudyxApp extends StatefulWidget {
  const StudyxApp({super.key});

  @override
  StudyxAppState createState() {
    return StudyxAppState();
  }
}

class StudyxAppState extends State<StudyxApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Studyx',
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const Dashboard(),
    );
  }
}
