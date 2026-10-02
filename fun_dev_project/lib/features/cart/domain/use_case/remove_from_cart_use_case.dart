import 'package:fun_dev_project/features/cart/domain/repository/cart_repository.dart';

import '../entity/cart_entity.dart';

class RemoveFromCartUseCase {
  CartRepository cartRepository;

  RemoveFromCartUseCase({required this.cartRepository});

  Future<CartEntity> call({
    required String userId,
    required String itemId,
    required String sizeId,
    required String colorId,
  }) async {
    return await cartRepository.removeFromCart(
      userId: userId,
      itemId: itemId,
      sizeId: sizeId,
      colorId: colorId,
    );
  }
}
