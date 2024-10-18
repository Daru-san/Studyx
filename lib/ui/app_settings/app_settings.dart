import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:provider/provider.dart';
import 'package:studyx/ui/theming/theme_provider.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({super.key});

  @override
  State<AppSettings> createState() => _AppSettingsState();
}
bool getThemeMode(BuildContext context) {
  final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
  bool isDark = themeProvider.themeMode == ThemeMode.dark;
  return isDark;
}
class _AppSettingsState extends State<AppSettings> {
  @override
  Widget build(BuildContext context) {
    bool isDark = getThemeMode(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Theme'),
            tiles: [
              SettingsTile.switchTile(
                leading: const Icon(Icons.dark_mode),
                initialValue: true,
                title: const Text('Enable Dark theme'),
                onToggle: (bool isDarkMode) {
                  final themeProvider = Provider.of(context, listen: false);
                  themeProvider.setThemeMode(
                    isDarkMode ? ThemeMode.dark : ThemeMode.light,
                  );
                },
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Advanced'),
            tiles: [
              SettingsTile(
                title: const Text('Backup data'),
                trailing: TextButton(
                  onPressed: () {},
                  child: const Icon(Icons.backup),
                ),
              ),
              SettingsTile(
                title: const Text('Reset your data'),
                trailing: TextButton(
                  onPressed: () {},
                  child: const Icon(Icons.restart_alt),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}