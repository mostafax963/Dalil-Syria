import 'package:dalil_syria/features/favorite/data/datasources/favorites_local_data_source.dart';

import 'package:flutter_riverpod/legacy.dart';

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<String>>((ref) {
      return FavoritesNotifier();
    });

class FavoritesNotifier extends StateNotifier<List<String>> {
  final FavoritesLocalDataSource local = FavoritesLocalDataSource();

  FavoritesNotifier() : super([]) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    state = await local.getFavorites();
  }

  Future<void> toggle(String tripId) async {
    await local.toggleFavorite(tripId);
    await loadFavorites();
  }

  bool isFav(String tripId) {
    return state.contains(tripId);
  }
}
