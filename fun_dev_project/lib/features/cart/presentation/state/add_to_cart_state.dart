import '../../domain/entity/cart_entity.dart';

abstract class AddToCartState {}

class AddToCartStateLoading extends AddToCartState {}

class AddToCartStateSuccess extends AddToCartState {
  CartEntity cartEntity;

  AddToCartStateSuccess({required this.cartEntity});
}

class AddToCartStateError extends AddToCartState {
  String message;

  AddToCartStateError({required this.message});
}

class AddToCartStateInitial extends AddToCartState {}
