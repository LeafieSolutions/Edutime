import '../entities/app_theme.dart';
import '../repository/theme_repository.dart';

class SaveThemeUseCase {
  final ThemeRepository repository;

  SaveThemeUseCase(this.repository);

  Future<void> call(AppTheme theme) async {
    await repository.saveTheme(theme);
  }
}