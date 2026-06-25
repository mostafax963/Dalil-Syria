import 'package:dalil_syria/core/errors/failures.dart';

import '../repositories/favorites_repository.dart';

class IsFavoriteUseCase {
  final FavoritesRepository repo;

  IsFavoriteUseCase(this.repo);

  Future<bool> call(String tripId) async {
    try {
      return await repo.isFavorite(tripId);
    } on CacheFailure catch (e) {
      throw CacheFailure(e.message);
    }
  }
}
