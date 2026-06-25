import 'package:dalil_syria/core/errors/exceptions.dart';
import 'package:dalil_syria/core/errors/failures.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../domain/repositories/favorites_repository.dart';
import '../datasources/favorites_local_data_source.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesLocalDataSource local;

  FavoritesRepositoryImpl(this.local);

  @override
  Future<List<String>> getFavorites() async {
    try {
      return await local.getFavorites();
    } on CacheException catch (e) {
      throw CacheFailure(e.message);
    } catch (_) {
      throw CacheFailure("error_generic".tr());
    }
  }

  @override
  Future<void> toggleFavorite(String tripId) async {
    try {
      await local.toggleFavorite(tripId);
    } on CacheException catch (e) {
      throw CacheFailure(e.message);
    } catch (_) {
      throw CacheFailure("error_generic".tr());
    }
  }

  @override
  Future<bool> isFavorite(String tripId) async {
    try {
      return await local.isFavorite(tripId);
    } on CacheException catch (e) {
      throw CacheFailure(e.message);
    } catch (_) {
      throw CacheFailure("error_generic".tr());
    }
  }
}
