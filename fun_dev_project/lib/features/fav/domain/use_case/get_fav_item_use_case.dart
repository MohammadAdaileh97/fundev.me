import 'package:fun_dev_project/features/fav/domain/repository/fav_repository.dart';

import '../entity/fav_item_entity.dart';

class GetFavItemUseCase {
  FavRepository favRepository;

  GetFavItemUseCase({required this.favRepository});

  Future<List<FavItemEntity>> call({required String userId}) async {
    return await favRepository.getFavItems(userId: userId);
  }
}
