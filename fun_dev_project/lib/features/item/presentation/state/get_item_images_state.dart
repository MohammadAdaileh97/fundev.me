import 'package:fun_dev_project/features/item/domain/entity/item_images_entity.dart';

abstract class GetItemImagesState {}

class GetItemImagesStateLoading extends GetItemImagesState {}

class GetItemImagesStateSuccess extends GetItemImagesState {
  final List<ItemImagesEntity> images;

  GetItemImagesStateSuccess({required this.images});
}

class GetItemImagesStateError extends GetItemImagesState {
  final String message;

  GetItemImagesStateError({required this.message});
}

class GetItemImagesStateInitial extends GetItemImagesState {}
