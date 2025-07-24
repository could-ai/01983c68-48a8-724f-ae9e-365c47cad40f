import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:couldai_user_app/providers/theme_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.watch(themeProvider.notifier);
    final themeMode = ref.watch(themeProvider).themeMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theme Settings',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16.0),
            ListTile(
              title: const Text('Dark Mode'),
              trailing: Switch(
                value: themeMode == ThemeMode.dark,
                onChanged: (value) {
                  themeNotifier.setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
                },
              ),
            ),
            ListTile(
              title: const Text('System Theme'),
              trailing: Switch(
                value: themeMode == ThemeMode.system,
                onChanged: (value) {
                  themeNotifier.setThemeMode(value ? ThemeMode.system : ThemeMode.light);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
