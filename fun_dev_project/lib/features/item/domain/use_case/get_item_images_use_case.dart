import 'package:fun_dev_project/features/item/domain/entity/item_images_entity.dart';
import 'package:fun_dev_project/features/item/domain/repository/items_repository.dart';


class GetItemImagesUseCase {
  ItemsRepository itemsRepository;

  GetItemImagesUseCase({required this.itemsRepository});

  Future<List<ItemImagesEntity>> call({required String idItem}) async {
    return await itemsRepository.getItemImages(idItems: idItem);
  }
}
