import '../repository/theme_repository.dart';

class ToggleThemeUseCase {
  final ThemeRepository repository;

  ToggleThemeUseCase(this.repository);

  Future<void> call() async {
    return await repository.toggleTheme();
  }
}