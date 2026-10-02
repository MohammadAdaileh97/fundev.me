import 'package:fun_dev_project/core/network/api_client.dart';
import 'package:fun_dev_project/features/home/data/model/ads_model.dart';
import 'package:fun_dev_project/features/home/domain/entity/ads_entity.dart';

abstract class HomeDataSource {
  Future<List<AdsEntity>> getAds();
}

class HomeDataSourceImp extends HomeDataSource {
  @override
  Future<List<AdsEntity>> getAds() async {
    final response = await ApiClient.getDataList(
      endPoint: "getAds.php",
      fromJsonT: (data) => AdsModel.fromJson(json: data),
    );
    return response;
  }
}
