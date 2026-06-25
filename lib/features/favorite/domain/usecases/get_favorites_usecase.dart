import 'package:dalil_syria/core/errors/failures.dart';

import '../repositories/favorites_repository.dart';

class GetFavoritesUseCase {
  final FavoritesRepository repo;

  GetFavoritesUseCase(this.repo);

  Future<List<String>> call() async {
    try {
      return await repo.getFavorites();
    } on CacheFailure catch (e) {
      throw CacheFailure(e.message);
    }
  }
}
