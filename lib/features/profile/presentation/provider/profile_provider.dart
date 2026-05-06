import 'package:dalil_syria/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:dalil_syria/features/profile/data/models/profile_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileProvider = FutureProvider<ProfileModel>((ref) async {
  final remote = ProfileRemoteDataSource();
  final data = await remote.getProfile();

  final user = data['user'];
  final profile = data['profile'] as Map<String, dynamic>?;

  return ProfileModel.fromMap({
    'id': user.id,
    'email': user.email ?? '',
    'created_at': user.createdAt,
    'full_name': profile?['full_name'] ?? 'No Name',
    'phone': profile?['phone'] ?? '-',
    'city': profile?['city'] ?? '-',
  });
});
