import 'package:fun_dev_project/features/cart/domain/repository/cart_repository.dart';

import '../entity/cart_entity.dart';

class AddToCartUseCase {
  CartRepository cartRepository;

  AddToCartUseCase({required this.cartRepository});

  Future<CartEntity> call({
    required String userId,
    required String itemId,
    required String sizeId,
    required String colorId,
    required String quantity,
  }) async {
    return await cartRepository.addToCart(
      userId: userId,
      itemId: itemId,
      sizeId: sizeId,
      colorId: colorId,
      quantity: quantity,
    );
  }
}
