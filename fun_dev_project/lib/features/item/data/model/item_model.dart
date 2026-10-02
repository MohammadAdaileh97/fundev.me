import 'package:fun_dev_project/core/utl/general.dart';
import 'package:fun_dev_project/features/item/domain/entity/item_entity.dart';

class ItemModel extends ItemEntity {
  ItemModel({
    required super.id,
    required super.name,
    required super.categoryName,
    required super.imageUrl,
    required super.rate,
    required super.price,
    required super.numberRates,
    required super.description,
    required super.isFavorite,
  });

  factory ItemModel.fromJson({required Map<String, dynamic> json}) {
    return ItemModel(
      id: json['Id'],
      name: json['Name'],
      categoryName: json['CategoryName'],
      imageUrl: json['ImageUrl'],
      rate: json['Rate'],
      price: General.convertToDouble(json['Price']),
      numberRates: json['NumberRates'],
      description: json['des'],
      isFavorite: json['isFav'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'CategoryName': categoryName,
      'ImageUrl': imageUrl,
      'Rate': rate,
      'Price': price,
      'NumberRates': numberRates,
      'des': description,
      'isFav': isFavorite,
    };
  }
}
