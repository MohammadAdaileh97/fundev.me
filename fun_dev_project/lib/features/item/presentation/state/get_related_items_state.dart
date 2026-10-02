import '../../domain/entity/item_entity.dart';

abstract class GetRelatedItemsState {}

class GetRelatedItemsStateLoading extends GetRelatedItemsState {}

class GetRelatedItemsStateSuccess extends GetRelatedItemsState {
  final List<ItemEntity> items;

  GetRelatedItemsStateSuccess({required this.items});
}

class GetRelatedItemsStateError extends GetRelatedItemsState {
  final String message;

  GetRelatedItemsStateError({required this.message});
}

class GEtItemsStateInitial extends GetRelatedItemsState {}
