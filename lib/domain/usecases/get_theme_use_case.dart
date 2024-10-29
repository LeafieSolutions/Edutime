import '../entities/app_theme.dart';
import '../repository/theme_repository.dart';

class GetThemeUseCase {
  final ThemeRepository repository;

  GetThemeUseCase(this.repository);

  Future<ThemeEntity> call() async {
    return await repository.getTheme();
  }
}