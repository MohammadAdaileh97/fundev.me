import 'package:fun_dev_project/features/cart/domain/entity/cart_entity.dart';

abstract class RemoveFromCartState {}

class RemoveFromCartStateLoading extends RemoveFromCartState {}

class RemoveFromCartStateSuccess extends RemoveFromCartState {
  CartEntity cartEntity;

  RemoveFromCartStateSuccess({required this.cartEntity});
}

class RemoveFromCartStateError extends RemoveFromCartState {
  String message;

  RemoveFromCartStateError({required this.message});
}

class RemoveFromCartStateInitial extends RemoveFromCartState {}
