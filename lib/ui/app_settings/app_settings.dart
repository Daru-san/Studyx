import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

  @override
  Widget build(BuildContext context) {
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
                onToggle: (bool value) {},
                title: const Text('Enable Dark theme'),
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