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

Icon getIcon(bool isDark) {
  Icon switchIcon;
  if (isDark) {
    switchIcon = const Icon(Icons.light_mode);
  } else {
    switchIcon = const Icon(Icons.dark_mode);
  }
  return switchIcon;
}

class _AppSettingsState extends State<AppSettings> {
  @override
  Widget build(BuildContext context) {
    bool isDark = getThemeMode(context);
    Icon switchIcon = getIcon(isDark);

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
                leading: switchIcon,
                initialValue: isDark,
                title: const Text('Enable Dark theme'),
                onToggle: (isDarkMode) {
                  final themeProvider =
                      Provider.of<ThemeProvider>(context, listen: false);
                  themeProvider.setThemeMode(
                    isDarkMode ? ThemeMode.dark : ThemeMode.light,
                  );
                  setState(() {
                    isDark = themeProvider.themeMode == ThemeMode.dark;
                    switchIcon = getIcon(isDark);
                  });
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
