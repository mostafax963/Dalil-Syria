import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/attraction_remote_data_source.dart';

final attractionDataSourceProvider = Provider((ref) {
  return AttractionRemoteDataSource();
});

final attractionsProvider = FutureProvider((ref) async {
  return ref.read(attractionDataSourceProvider).getAttractions();
});

final attractionDetailsProvider = FutureProvider.family((ref, String id) async {
  return ref.read(attractionDataSourceProvider).getAttractionDetails(id);
});
