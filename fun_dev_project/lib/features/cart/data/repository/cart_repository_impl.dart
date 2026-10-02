import 'package:fun_dev_project/features/cart/data/data_source/cart_data_source.dart';
import 'package:fun_dev_project/features/cart/domain/entity/cart_entity.dart';

import 'package:fun_dev_project/features/cart/domain/entity/cart_item_entity.dart';

import '../../domain/repository/cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  CartDataSource cartDataSource;

  CartRepositoryImpl({required this.cartDataSource});

  @override
  Future<CartEntity> addToCart({
    required String userId,
    required String itemId,
    required String sizeId,
    required String colorId,
    required String quantity,
  }) async {
    return await cartDataSource.addToCart(
      userId: userId,
      itemId: itemId,
      sizeId: sizeId,
      colorId: colorId,
      quantity: quantity,
    );
  }

  @override
  Future<List<CartItemEntity>> getCart({required String userId}) async {
    return await cartDataSource.getCart(userId: userId);
  }

  @override
  Future<CartEntity> removeFromCart({
    required String userId,
    required String itemId,
    required String sizeId,
    required String colorId,
  }) async {
    return await cartDataSource.removeFromCart(
      userId: userId,
      itemId: itemId,
      sizeId: sizeId,
      colorId: colorId,
    );
  }
}
