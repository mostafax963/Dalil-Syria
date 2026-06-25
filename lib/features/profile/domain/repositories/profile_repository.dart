import 'package:dalil_syria/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<ProfileEntity> getProfile();

  Future<void> logout();
}
