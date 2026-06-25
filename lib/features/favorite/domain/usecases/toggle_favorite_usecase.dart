import 'package:dalil_syria/core/errors/failures.dart';

import '../repositories/favorites_repository.dart';

class ToggleFavoriteUseCase {
  final FavoritesRepository repo;

  ToggleFavoriteUseCase(this.repo);

  Future<void> call(String tripId) async {
    try {
      await repo.toggleFavorite(tripId);
    } on CacheFailure catch (e) {
      throw CacheFailure(e.message);
    }
  }
}
