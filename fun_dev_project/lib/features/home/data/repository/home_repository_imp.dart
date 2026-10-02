import 'package:fun_dev_project/features/home/data/data_source/home_data_source.dart';
import 'package:fun_dev_project/features/home/domain/entity/ads_entity.dart';
import 'package:fun_dev_project/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImp extends HomeRepository {
  HomeDataSource dataSource;

  HomeRepositoryImp({required this.dataSource});

  @override
  Future<List<AdsEntity>> getAds() async {
    return await dataSource.getAds();
  }
}
