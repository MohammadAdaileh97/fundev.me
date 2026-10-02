import 'package:fun_dev_project/core/network/api_client.dart';
import 'package:fun_dev_project/features/cart/data/model/cart_model.dart';
import 'package:fun_dev_project/features/cart/domain/entity/cart_entity.dart';
import 'package:fun_dev_project/features/cart/domain/entity/cart_item_entity.dart';

import '../model/cart_item_model.dart';

abstract class CartDataSource {
  Future<CartEntity> addToCart({
    required String userId,
    required String itemId,
    required String sizeId,
    required String colorId,
    required String quantity,
  });

  Future<CartEntity> removeFromCart({
    required String userId,
    required String itemId,
    required String sizeId,
    required String colorId,
  });

  Future<List<CartItemEntity>> getCart({required String userId});
}

class CartDataSourceImpl implements CartDataSource {
  @override
  Future<CartEntity> addToCart({
    required String userId,
    required String itemId,
    required String sizeId,
    required String colorId,
    required String quantity,
  }) {
    final response = ApiClient.postData(
      endPoint: "add_to_cart.php",
      body: {
        "userId": userId,
        "itemId": itemId,
        "sizeId": sizeId,
        "colorId": colorId,
        "quantity": quantity,
      },
      fromJsonT: (data) => CartModel.fromJson(json: data),
    );
    return response;
  }

  @override
  Future<List<CartItemEntity>> getCart({required String userId}) {
    final response = ApiClient.getDataList(
      endPoint: "get_cart.php?userId=$userId",
      fromJsonT: (data) => CartItemModel.fromJson(json: data),
    );
    return response;
  }

  @override
  Future<CartEntity> removeFromCart({
    required String userId,
    required String itemId,
    required String sizeId,
    required String colorId,
  }) {
    final response = ApiClient.postData(
      endPoint: "remove_from_cart.php",
      body: {
        "userId": userId,
        "itemId": itemId,
        "sizeId": sizeId,
        "colorId": colorId,
      },
      fromJsonT: (data) => CartModel.fromJson(json: data),
    );
    return response;
  }
}
