import 'package:fun_dev_project/features/cart/domain/repository/cart_repository.dart';

import '../entity/cart_item_entity.dart';

class GetCartItemUseCase {
  CartRepository cartRepository;

  GetCartItemUseCase({required this.cartRepository});

  Future<List<CartItemEntity>> call({required String userId}) async {
    return await cartRepository.getCart(userId: userId);
  }
}
