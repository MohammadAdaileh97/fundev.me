import 'package:image_picker/image_picker.dart';

abstract class TakeImagesState {}

class TakeImagesStateLoading extends TakeImagesState {}

class TakeImagesStateSuccess extends TakeImagesState {
  final List<XFile> images;

  TakeImagesStateSuccess({required this.images});
}

class TakeImagesStateError extends TakeImagesState {
  final String message;

  TakeImagesStateError({required this.message});
}

class TakeImagesStateInitial extends TakeImagesState {}
