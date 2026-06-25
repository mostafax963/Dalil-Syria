abstract class FavoritesRepository {
  Future<List<String>> getFavorites();

  Future<void> toggleFavorite(String tripId);

  Future<bool> isFavorite(String tripId);
}
