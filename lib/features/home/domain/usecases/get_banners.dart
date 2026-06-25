import 'package:dalil_syria/features/home/domain/entities/banner_entity.dart';
import 'package:dalil_syria/features/home/domain/repositories/home_repository.dart';

class GetBanners {
  final HomeRepository repo;

  GetBanners(this.repo);

  Future<List<BannerEntity>> call() {
    return repo.getBanners();
  }
}
