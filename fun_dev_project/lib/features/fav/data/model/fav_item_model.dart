import 'package:fun_dev_project/features/fav/domain/entity/fav_item_entity.dart';

class FavItemModel extends FavItemEntity {
  FavItemModel({
    required super.id,
    required super.name,
    required super.categoryName,
    required super.imageUrl,
    required super.rate,
    required super.price,
    required super.numberRates,
    required super.des,
  });

  factory FavItemModel.fromJson({required Map<String, dynamic> json}) {
    return FavItemModel(
      id: json['Id'],
      name: json['Name'],
      categoryName: json['CategoryName'],
      imageUrl: json['ImageUrl'],
      rate: json['Rate'],
      price: json['Price'],
      numberRates: json['NumberRates'],
      des: json['des'],
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
      'des': des,
    };
  }
}
