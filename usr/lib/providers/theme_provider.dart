import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppTheme {
  final ThemeData lightTheme;
  final ThemeData darkTheme;
  final ThemeMode themeMode;

  AppTheme({
    required this.lightTheme,
    required this.darkTheme,
    this.themeMode = ThemeMode.system,
  });

  AppTheme copyWith({ThemeData? lightTheme, ThemeData? darkTheme, ThemeMode? themeMode}) {
    return AppTheme(
      lightTheme: lightTheme ?? this.lightTheme,
      darkTheme: darkTheme ?? this.darkTheme,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(_initialTheme());

  static AppTheme _initialTheme() {
    return AppTheme(
      lightTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        
      ),
    );
  }

  void setThemeMode(ThemeMode mode) {
    state = state.copyWith(themeMode: mode);
  }

  // You can add methods here to change primary colors, etc.
}
