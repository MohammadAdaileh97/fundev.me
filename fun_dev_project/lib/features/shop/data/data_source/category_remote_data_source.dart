import '../../../../core/network/api_client.dart';
import '../../domain/entity/category_entity.dart';
import '../model/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryEntity>> getCategories();
}

class CategoryRemoteDataSourceImpl extends CategoryRemoteDataSource {
  @override
  Future<List<CategoryEntity>> getCategories() async {
    final response = await ApiClient.getDataList<CategoryEntity>(
      endPoint: "getCategories.php",
      fromJsonT: (data) => CategoryModel.fromJson(json: data),
    );
    return response;
  }
}
