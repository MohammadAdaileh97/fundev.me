import 'package:fun_dev_project/features/cart/domain/entity/cart_item_entity.dart';

class CartItemModel extends CartItemEntity {
  CartItemModel({
    required super.itemPrice,
    required super.quantity,
    required super.size,
    required super.color,
    required super.cartId,
    required super.itemId,
    required super.itemName,
    required super.itemImageUrl,
  });

  factory CartItemModel.fromJson({required Map<String, dynamic> json}) {
    return CartItemModel(
      cartId: json['CartId'],
      itemId: json['ItemId'],
      itemName: json['ItemName'],
      itemImageUrl: json['ItemImageUrl'],
      itemPrice: json['ItemPrice'],
      quantity: json['Quantity'],
      size: json['Size'],
      color: json['Color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'CartId': cartId,
      'ItemId': itemId,
      'ItemName': itemName,
      'ItemImageUrl': itemImageUrl,
      'ItemPrice': itemPrice,
      'Quantity': quantity,
      'Size': size,
      'Color': color,
    };
  }
}
