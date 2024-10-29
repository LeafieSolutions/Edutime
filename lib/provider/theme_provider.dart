// presentation/providers/theme_provider.dart
import 'package:flutter/material.dart';
import '../domain/entities/app_theme.dart';
import '../domain/usecases/get_theme_use_case.dart';
import '../domain/usecases/save_theme_use_case.dart';
import '../domain/usecases/toggle_theme_use_case.dart';

class ThemeProvider with ChangeNotifier {
  final GetThemeUseCase getThemeUseCase;
  final SaveThemeUseCase saveThemeUseCase;
  final ToggleThemeUseCase toggleThemeUseCase;

  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  ThemeProvider({
    required this.getThemeUseCase,
    required this.saveThemeUseCase,
    required this.toggleThemeUseCase,
  }) {
    _loadTheme();
  }

  void _loadTheme() async {
    final themeEntity = await getThemeUseCase.call();
    _themeMode = _mapAppThemeToThemeMode(themeEntity.appTheme);
    notifyListeners();
  }

  void changeTheme(AppTheme theme) async {
    _themeMode = _mapAppThemeToThemeMode(theme);
    await saveThemeUseCase.call(theme);
    notifyListeners();
  }

  void toggleTheme() async {
    await toggleThemeUseCase.call();
    _loadTheme(); // Reload theme after toggling
  }

  ThemeMode _mapAppThemeToThemeMode(AppTheme appTheme) {
    switch (appTheme) {
      case AppTheme.light:
        return ThemeMode.light;
      case AppTheme.dark:
        return ThemeMode.dark;
      case AppTheme.system:
      default:
        return ThemeMode.system;
    }
  }
}
