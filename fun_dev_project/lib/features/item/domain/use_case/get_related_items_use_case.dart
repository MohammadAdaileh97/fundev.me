import 'package:fun_dev_project/features/item/domain/repository/items_repository.dart';

import '../entity/item_entity.dart';

class GetRelatedItemsUseCase {
  ItemsRepository itemsRepository;

  GetRelatedItemsUseCase({required this.itemsRepository});

  Future<List<ItemEntity>> call({required String idItem, required String userId}) async {
    return await itemsRepository.getRelatedItems(idItem: idItem, userId: userId);
  }
}
