import 'package:fun_dev_project/features/fav/data/data_source/fav_data_source.dart';
import 'package:fun_dev_project/features/fav/domain/entity/fav_entity.dart';
import 'package:fun_dev_project/features/fav/domain/entity/fav_item_entity.dart';
import 'package:fun_dev_project/features/fav/domain/repository/fav_repository.dart';

class FavRepositoryImpl extends FavRepository {
  FavDataSource favDataSource;

  FavRepositoryImpl({required this.favDataSource});

  @override
  Future<FavEntity> fav({
    required String idItem,
    required String userId,
  }) async {
    return await favDataSource.fav(idItem: idItem, userId: userId);
  }

  @override
  Future<List<FavItemEntity>> getFavItems({required String userId}) async {
    return await favDataSource.getFavItems(userId: userId);
  }
}
