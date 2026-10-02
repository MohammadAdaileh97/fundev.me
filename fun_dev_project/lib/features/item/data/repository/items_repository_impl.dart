import 'package:fun_dev_project/features/item/data/data_source/items_remote_data_source.dart';
import 'package:fun_dev_project/features/item/domain/entity/color_entity.dart';
import 'package:fun_dev_project/features/item/domain/entity/item_entity.dart';
import 'package:fun_dev_project/features/item/domain/entity/item_images_entity.dart';
import 'package:fun_dev_project/features/item/domain/entity/size_entity.dart';
import 'package:fun_dev_project/features/item/domain/repository/items_repository.dart';

class ItemsRepositoryImpl extends ItemsRepository {
  ItemsRemoteDataSource itemsRemoteDataSource;

  ItemsRepositoryImpl({required this.itemsRemoteDataSource});

  @override
  Future<List<ItemEntity>> getItems({
    required String idCategory,
    required String userId,
  }) async {
    return await itemsRemoteDataSource.getItems(
      idCategory: idCategory,
      userId: userId,
    );
  }

  @override
  Future<List<ColorEntity>> getColors() async {
    return await itemsRemoteDataSource.getColors();
  }

  @override
  Future<List<ItemEntity>> getRelatedItems({
    required String idItem,
    required String userId,
  }) async {
    return await itemsRemoteDataSource.getRelatedItems(
      idItem: idItem,
      userId: userId,
    );
  }

  @override
  Future<List<SizeEntity>> getSizes() async {
    return await itemsRemoteDataSource.getSizes();
  }

  @override
  Future<List<ItemImagesEntity>> getItemImages({
    required String idItems,
  }) async {
    return await itemsRemoteDataSource.getItemImages(idItems: idItems);
  }
}
