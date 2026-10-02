
import '../../domain/entity/category_entity.dart';
import '../../domain/repository/category_repository.dart';
import '../data_source/category_remote_data_source.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<CategoryEntity>> getCategories() async {
    return await remoteDataSource.getCategories();
  }
}
