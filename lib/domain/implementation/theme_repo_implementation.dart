import 'package:edutime/domain/entities/app_theme.dart';
import 'package:edutime/domain/repository/theme_repository.dart';

class ThemeRepoImplementation implements ThemeRepository {
  AppTheme _currentTheme = AppTheme.system; // In-memory theme variable

  @override
  Future<ThemeEntity> getTheme() async {
    return ThemeEntity(_currentTheme);
  }

  @override
  Future<void> saveTheme(AppTheme theme) async {
    _currentTheme = theme; // Simply update the in-memory theme
  }

  @override
  Future<void> toggleTheme() async {
    switch (_currentTheme) {
      case AppTheme.light:
        _currentTheme = AppTheme.dark;
        break;
      case AppTheme.dark:
        _currentTheme = AppTheme.system;
        break;
      case AppTheme.system:
      default:
        _currentTheme = AppTheme.light;
        break;
    }
  }
}