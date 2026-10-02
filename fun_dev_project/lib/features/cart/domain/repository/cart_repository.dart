import '../entity/cart_entity.dart';
import '../entity/cart_item_entity.dart';

abstract class CartRepository {
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
