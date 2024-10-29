import '../entities/app_theme.dart';

abstract class ThemeRepository {
  Future<ThemeEntity> getTheme(); // fetch user's theme choice
  Future<void> saveTheme(AppTheme theme); // dave user's theme choice
  Future<void> toggleTheme();
}