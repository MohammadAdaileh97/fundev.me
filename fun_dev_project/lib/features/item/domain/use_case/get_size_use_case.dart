import 'package:fun_dev_project/features/item/domain/entity/size_entity.dart';
import 'package:fun_dev_project/features/item/domain/repository/items_repository.dart';

class GetSizeUseCase {
  ItemsRepository itemsRepository;

  GetSizeUseCase({required this.itemsRepository});

  Future<List<SizeEntity>> call() async {
    return await itemsRepository.getSizes();
  }
}
