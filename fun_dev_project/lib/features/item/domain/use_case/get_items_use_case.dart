import 'package:fun_dev_project/features/item/domain/repository/items_repository.dart';

import '../entity/item_entity.dart';

class GetItemsUseCase {
  ItemsRepository itemsRepository;

  GetItemsUseCase({required this.itemsRepository});

  Future<List<ItemEntity>> call({required String idCategory, required String userId}) async {
    return await itemsRepository.getItems(idCategory: idCategory, userId: userId);
  }
}
