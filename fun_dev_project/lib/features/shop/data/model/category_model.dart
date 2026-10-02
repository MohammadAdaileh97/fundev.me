
import '../../domain/entity/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.id,
    required super.name,
    required super.imageUrl,
  });

  factory CategoryModel.fromJson({required Map<String, dynamic> json}) {
    return CategoryModel(
      id: json['Id'],
      name: json['Name'],
      imageUrl: json['ImageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'Id': id, 'Name': name, 'ImageUrl': imageUrl};
  }
}
