import 'package:fun_dev_project/features/cart/domain/entity/cart_item_entity.dart';

abstract class GetCartItemState {}

class GetCartItemStateLoading extends GetCartItemState {}

class GetCartItemStateSuccess extends GetCartItemState {
  List<CartItemEntity> items;

  GetCartItemStateSuccess({required this.items});
}

class GetCartItemStateError extends GetCartItemState {
  String message;

  GetCartItemStateError({required this.message});
}

class GetCartItemStateInitial extends GetCartItemState {}
