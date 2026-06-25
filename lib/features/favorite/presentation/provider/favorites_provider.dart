import 'package:dalil_syria/core/errors/failures.dart';
import 'package:dalil_syria/features/favorite/data/datasources/favorites_local_data_source.dart';
import 'package:dalil_syria/features/favorite/data/repositories/favorites_repository_impl.dart';
import 'package:dalil_syria/features/favorite/domain/repositories/favorites_repository.dart';
import 'package:dalil_syria/features/favorite/domain/usecases/get_favorites_usecase.dart';
import 'package:dalil_syria/features/favorite/domain/usecases/is_favorite_usecase.dart';
import 'package:dalil_syria/features/favorite/domain/usecases/toggle_favorite_usecase.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final favoritesLocalDataSourceProvider = Provider((ref) {
  return FavoritesLocalDataSource();
});

final favoritesRepositoryProvider = Provider<FavoritesRepository>((ref) {
  return FavoritesRepositoryImpl(ref.read(favoritesLocalDataSourceProvider));
});

final getFavoritesUseCaseProvider = Provider((ref) {
  return GetFavoritesUseCase(ref.read(favoritesRepositoryProvider));
});

final toggleFavoriteUseCaseProvider = Provider((ref) {
  return ToggleFavoriteUseCase(ref.read(favoritesRepositoryProvider));
});

final isFavoriteUseCaseProvider = Provider((ref) {
  return IsFavoriteUseCase(ref.read(favoritesRepositoryProvider));
});

class FavoritesState {
  final List<String> favorites;

  final bool isLoading;

  final String? error;

  FavoritesState({
    this.favorites = const [],
    this.isLoading = false,
    this.error,
  });

  FavoritesState copyWith({
    List<String>? favorites,
    bool? isLoading,
    String? error,
  }) {
    return FavoritesState(
      favorites: favorites ?? this.favorites,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class FavoritesNotifier extends StateNotifier<FavoritesState> {
  final GetFavoritesUseCase getFavoritesUseCase;

  final ToggleFavoriteUseCase toggleFavoriteUseCase;

  final IsFavoriteUseCase isFavoriteUseCase;

  FavoritesNotifier(
    this.getFavoritesUseCase,
    this.toggleFavoriteUseCase,
    this.isFavoriteUseCase,
  ) : super(FavoritesState()) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final data = await getFavoritesUseCase();

      state = state.copyWith(favorites: data, isLoading: false);
    } on CacheFailure catch (e) {
      state = state.copyWith(isLoading: false, error: e.message);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: "error_generic".tr());
    }
  }

  Future<void> toggle(String tripId) async {
    try {
      await toggleFavoriteUseCase(tripId);

      await loadFavorites();
    } on CacheFailure catch (e) {
      state = state.copyWith(error: e.message);
    }
  }

  bool isFav(String tripId) {
    return state.favorites.contains(tripId);
  }
}

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, FavoritesState>((ref) {
      return FavoritesNotifier(
        ref.read(getFavoritesUseCaseProvider),
        ref.read(toggleFavoriteUseCaseProvider),
        ref.read(isFavoriteUseCaseProvider),
      );
    });
