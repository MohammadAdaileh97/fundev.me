
import '../entity/category_entity.dart';
import '../repository/category_repository.dart';

class GetCategoryUseCase {
  CategoryRepository categoryRepository;

  GetCategoryUseCase({required this.categoryRepository});

  Future<List<CategoryEntity>> call() async {
    return await categoryRepository.getCategories();
  }
}
