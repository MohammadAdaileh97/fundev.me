import 'package:fun_dev_project/features/fav/domain/repository/fav_repository.dart';

import '../entity/fav_entity.dart';

class FavUseCase {
  FavRepository favRepository;

  FavUseCase({required this.favRepository});

  Future<FavEntity> call({
    required String idItem,
    required String userId,
  }) async {
    return await favRepository.fav(idItem: idItem, userId: userId);
  }
}
