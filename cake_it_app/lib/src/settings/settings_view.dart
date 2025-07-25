import 'package:flutter/material.dart';

import 'settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          // Glue the SettingsController to the theme selection DropdownButton.
          //
          // When a user selects a theme from the dropdown list, the
          // SettingsController is updated, which rebuilds the MaterialApp.
          child: DropdownButton<ThemeMode>(
            // Read the selected themeMode from the controller
            value: controller.themeMode,
            // Call the updateThemeMode method any time the user selects a theme.
            onChanged: controller.updateThemeMode,
            items: ThemeMode.values.map((mode) {
              String label;

              switch (mode) {
                case ThemeMode.system:
                  label = 'System Theme';
                  break;
                case ThemeMode.light:
                  label = 'Light Theme';
                  break;
                case ThemeMode.dark:
                  label = 'Dark Theme';
                  break;
              }

              return DropdownMenuItem(
                value: mode,
                child: MediaQuery.withClampedTextScaling(
                  maxScaleFactor: 1.5,
                  child: Text(label),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
