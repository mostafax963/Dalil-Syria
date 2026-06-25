import 'package:dalil_syria/core/errors/exceptions.dart';
import 'package:dalil_syria/core/errors/failures.dart';
import 'package:dalil_syria/core/network/network_info.dart';
import 'package:dalil_syria/features/profile/domain/entities/profile_entity.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_data_source.dart';
import '../models/profile_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remote;
  final NetworkInfo networkInfo;
  ProfileRepositoryImpl(this.remote, this.networkInfo);

  @override
  Future<ProfileEntity> getProfile() async {
    if (!await networkInfo.isConnected) {
      throw ServerFailure("coniction_state".tr());
    }
    try {
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
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } catch (_) {
      throw ServerFailure("error_generic".tr());
    }
  }

  @override
  Future<void> logout() async {
    if (!await networkInfo.isConnected) {
      throw ServerFailure("coniction_state".tr());
    }
    try {
      await remote.logout();
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    } catch (_) {
      throw ServerFailure("error_generic".tr());
    }
  }
}
