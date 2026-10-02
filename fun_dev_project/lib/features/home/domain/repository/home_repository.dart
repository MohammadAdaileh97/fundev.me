import '../entity/ads_entity.dart';

abstract class HomeRepository {
  Future<List<AdsEntity>> getAds();
}
