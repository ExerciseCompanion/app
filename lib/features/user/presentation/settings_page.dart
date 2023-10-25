import 'package:flutter/material.dart';
import '../../generic/presentation/app_bar.dart';
import '../../generic/presentation/bottom_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/theme_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return Scaffold(
      appBar: BaseAppBar(
        appBar: AppBar(),
        title: "Settings",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        // Glue the SettingsController to the theme selection DropdownButton.
        //
        // When a user selects a theme from the dropdown list, the
        // SettingsController is updated, which rebuilds the MaterialApp.
        child: DropdownButton<ThemeMode>(
          // Read the selected themeMode from the controller
          value: theme,
          // Call the updateThemeMode method any time the user selects a theme.
          onChanged: (themeMode) {
            ref.read(themeProvider.notifier).setTheme(themeMode);
          },
          items: const [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text('System Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text('Light Theme'),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text('Dark Theme'),
            )
          ],
        ),
      ),
    );
  }
}
