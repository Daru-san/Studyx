import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:studyx/theme/theme_service.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({super.key});

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  bool isDark = false;
  void getTheme() async {
    final service = await ThemeService.instance;
    isDark = service.currentThemeName == 'dark';
  }

  bool getDarkTheme() {
    getTheme();
    return isDark;
  }

  String getDarkLabel(isDark) {
    String text;
    if (isDark) {
      text = 'Disable dark theme';
    } else {
      text = 'Enable dark theme';
    }
    return text;
  }

  Icon getDarkIcon(isDark) {
    Icon themeIcon;
    if (isDark) {
      themeIcon = const Icon(Icons.dark_mode);
    } else {
      themeIcon = const Icon(Icons.light_mode);
    }
    return themeIcon;
  }

  @override
  Widget build(BuildContext context) {
    bool isThemeDark = getDarkTheme();
    String darkLabel = getDarkLabel(isThemeDark);
    Icon themeIcon = getDarkIcon(isThemeDark);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Theme'),
            tiles: [
              CustomSettingsTile(
                child: ThemeSwitcher(
                  builder: (context) {
                    return SwitchListTile(
                      value: isThemeDark,
                      onChanged: (value) async {
                        final themeSwitcher = ThemeSwitcher.of(context);
                        final themeName = value ? 'dark' : 'light';
                        final service = await ThemeService.instance
                          ..save(themeName);
                        final theme = service.getByName(themeName);
                        themeSwitcher.changeTheme(theme: theme);

                        getTheme();
                        setState(() {
                          isThemeDark = themeName == 'dark';
                          darkLabel = getDarkLabel(isDark);
                          themeIcon = getDarkIcon(isDark);
                        });
                      },
                      title: RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: themeIcon,
                            ),
                            WidgetSpan(
                              child: Text(darkLabel),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
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
