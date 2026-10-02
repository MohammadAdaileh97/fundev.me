import 'package:fun_dev_project/features/item/data/model/color_model.dart';
import 'package:fun_dev_project/features/item/domain/entity/color_entity.dart';
import 'package:fun_dev_project/features/item/domain/entity/item_entity.dart';
import 'package:fun_dev_project/features/item/domain/entity/item_images_entity.dart';

import '../../../../core/network/api_client.dart';
import '../../domain/entity/size_entity.dart';
import '../model/item_images_model.dart';
import '../model/item_model.dart';
import '../model/size_model.dart';

abstract class ItemsRemoteDataSource {
  Future<List<ItemEntity>> getItems({
    required String idCategory,
    required String userId,
  });

  Future<List<ItemEntity>> getRelatedItems({
    required String idItem,
    required String userId,
  });

  Future<List<ColorEntity>> getColors();

  Future<List<SizeEntity>> getSizes();

  Future<List<ItemImagesEntity>> getItemImages({required String idItems});
}

class ItemsRemoteDataSourceImpl extends ItemsRemoteDataSource {
  @override
  Future<List<ItemEntity>> getItems({
    required String idCategory,
    required String userId,
  }) async {
    final response = await ApiClient.getDataList<ItemEntity>(
      endPoint: "getItems.php?Id_category=$idCategory&userId=$userId",
      fromJsonT: (data) => ItemModel.fromJson(json: data),
    );
    return response;
  }

  @override
  Future<List<ColorEntity>> getColors() {
    final response = ApiClient.getDataList<ColorEntity>(
      endPoint: "getColors.php",
      fromJsonT: (data) => ColorModel.fromJson(json: data),
    );
    return response;
  }

  @override
  Future<List<ItemEntity>> getRelatedItems({
    required String idItem,
    required String userId,
  }) {
    final response = ApiClient.getDataList<ItemEntity>(
      endPoint: "getRelatedItems.php?Id_item=$idItem&userId=$userId",
      fromJsonT: (data) => ItemModel.fromJson(json: data),
    );
    return response;
  }

  @override
  Future<List<SizeEntity>> getSizes() {
    final response = ApiClient.getDataList<SizeEntity>(
      endPoint: "getSizes.php",
      fromJsonT: (data) => SizeModel.fromJson(json: data),
    );
    return response;
  }

  @override
  Future<List<ItemImagesEntity>> getItemImages({required String idItems}) {
    final response = ApiClient.getDataList<ItemImagesEntity>(
      endPoint: "getItemImages.php?id_items=$idItems",
      fromJsonT: (data) => ItemImagesModel.fromJson(json: data),
    );
    return response;
  }
}
