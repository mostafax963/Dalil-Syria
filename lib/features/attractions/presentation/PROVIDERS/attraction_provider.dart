import 'package:dalil_syria/core/errors/failures.dart';

import 'package:dalil_syria/core/providers/connection_provider.dart';
import 'package:dalil_syria/features/attractions/data/datasources/attraction_remote_data_source.dart';
import 'package:dalil_syria/features/attractions/data/repositories/attraction_repository_impl.dart';
import 'package:dalil_syria/features/attractions/domain/entities/attraction_details_entity.dart';
import 'package:dalil_syria/features/attractions/domain/entities/attraction_entity.dart';
import 'package:dalil_syria/features/attractions/domain/usecases/get_attraction_details_usecase.dart';
import 'package:dalil_syria/features/attractions/domain/usecases/get_attractions_usecase.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// DATA SOURCE

final attractionRemoteDataSourceProvider = Provider<AttractionRemoteDataSource>(
  (ref) {
    return AttractionRemoteDataSourceImpl(Supabase.instance.client);
  },
);

/// REPOSITORY

final attractionRepositoryProvider = Provider((ref) {
  return AttractionRepositoryImpl(
    ref.read(attractionRemoteDataSourceProvider),
    ref.read(networkInfoProvider),
  );
});

/// USE CASES

final getAttractionsUseCaseProvider = Provider((ref) {
  return GetAttractionsUseCase(ref.read(attractionRepositoryProvider));
});

final getAttractionDetailsUseCaseProvider = Provider((ref) {
  return GetAttractionDetailsUseCase(ref.read(attractionRepositoryProvider));
});

/// PROVIDERS

final attractionsProvider = FutureProvider<List<AttractionEntity>>((ref) async {
  try {
    return await ref.read(getAttractionsUseCaseProvider)();
  } on Failure catch (e) {
    throw e.message;
  } catch (_) {
    throw "error_generic".tr();
  }
});

final attractionDetailsProvider =
    FutureProvider.family<AttractionDetailsEntity, String>((ref, id) async {
      try {
        return await ref.read(getAttractionDetailsUseCaseProvider)(id);
      } on Failure catch (e) {
        throw e.message;
      } catch (_) {
        throw "error_generic".tr();
      }
    });
