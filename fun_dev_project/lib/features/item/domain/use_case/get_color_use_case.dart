import 'package:fun_dev_project/features/item/domain/repository/items_repository.dart';

import '../entity/color_entity.dart';

class GetColorUseCase {
  ItemsRepository itemsRepository;

  GetColorUseCase({required this.itemsRepository});

  Future<List<ColorEntity>> call() async {
    return await itemsRepository.getColors();
  }
}
