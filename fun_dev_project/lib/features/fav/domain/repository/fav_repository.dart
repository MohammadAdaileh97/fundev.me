import '../entity/fav_entity.dart';
import '../entity/fav_item_entity.dart';

abstract class FavRepository {
  Future<FavEntity> fav({required String idItem, required String userId});

  Future<List<FavItemEntity>> getFavItems({required String userId});
}
