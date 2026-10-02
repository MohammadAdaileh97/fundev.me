import '../entity/color_entity.dart';
import '../entity/item_entity.dart';
import '../entity/item_images_entity.dart';
import '../entity/size_entity.dart';

abstract class ItemsRepository {
  Future<List<ItemEntity>> getItems({required String idCategory, required String userId});

  Future<List<ItemEntity>> getRelatedItems({required String idItem, required String userId});

  Future<List<ColorEntity>> getColors();

  Future<List<SizeEntity>> getSizes();

  Future<List<ItemImagesEntity>> getItemImages({required String idItems});
}
