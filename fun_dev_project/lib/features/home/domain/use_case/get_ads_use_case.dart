import 'package:fun_dev_project/features/home/domain/entity/ads_entity.dart';
import 'package:fun_dev_project/features/home/domain/repository/home_repository.dart';

class GetAdsUseCase {
  HomeRepository homeRepository;

  GetAdsUseCase({required this.homeRepository});

  Future<List<AdsEntity>> call() async {
    return await homeRepository.getAds();
  }
}
