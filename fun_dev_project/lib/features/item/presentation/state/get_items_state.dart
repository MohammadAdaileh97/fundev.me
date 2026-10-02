import '../../domain/entity/item_entity.dart';

abstract class GetItemsState {}

class GetItemsStateLoading extends GetItemsState {}

class GetItemsStateSuccess extends GetItemsState {
  final List<ItemEntity> items;

  GetItemsStateSuccess({required this.items});
}

class GetItemsStateError extends GetItemsState {
  final String message;

  GetItemsStateError({required this.message});
}

class GEtItemsStateInitial extends GetItemsState {}
