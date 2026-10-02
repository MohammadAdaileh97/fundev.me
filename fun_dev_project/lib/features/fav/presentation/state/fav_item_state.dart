import '../../domain/entity/fav_item_entity.dart';

abstract class FavItemState {}

class FavItemLoading extends FavItemState {}

class FavItemSuccess extends FavItemState {
  List<FavItemEntity> favItemEntity;

  FavItemSuccess({required this.favItemEntity});
}

class FavItemError extends FavItemState {
  String msg;

  FavItemError({required this.msg});
}

class FavItemInitial extends FavItemState {}
