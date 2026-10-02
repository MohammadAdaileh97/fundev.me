import 'package:fun_dev_project/features/fav/domain/entity/fav_entity.dart';

abstract class FavState {}

class FavStateLoading extends FavState {}

class FavStateSuccess extends FavState {
  FavEntity favEntity;

  FavStateSuccess({required this.favEntity});
}

class FavStateError extends FavState {
  String msg;

  FavStateError({required this.msg});
}

class FavStateInitial extends FavState {}
