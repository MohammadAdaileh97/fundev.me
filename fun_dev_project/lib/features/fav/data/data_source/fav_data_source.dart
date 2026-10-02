import 'package:fun_dev_project/core/network/api_client.dart';
import 'package:fun_dev_project/features/fav/data/model/fav_item_model.dart';
import 'package:fun_dev_project/features/fav/data/model/fav_model.dart';
import 'package:fun_dev_project/features/fav/domain/entity/fav_entity.dart';

import '../../domain/entity/fav_item_entity.dart';

abstract class FavDataSource {
  Future<FavEntity> fav({required String idItem, required String userId});

  Future<List<FavItemEntity>> getFavItems({required String userId});
}

class FavDataSourceImpl implements FavDataSource {
  @override
  Future<FavEntity> fav({
    required String idItem,
    required String userId,
  }) async {
    final response = await ApiClient.getData(
      endPoint: "fav.php?userId=$userId&itemId=$idItem",
      fromJsonT: (data) => FavModel.fromJson(json: data),
    );
    return response;
  }

  @override
  Future<List<FavItemEntity>> getFavItems({required String userId}) async {
    final response = await ApiClient.getDataList(
      endPoint: "get_fav_items.php?userId=$userId",
      fromJsonT: (data) => FavItemModel.fromJson(json: data),
    );
    return response;
  }
}
