import '../../domain/entity/color_entity.dart';

abstract class GetColorState {}

class GetColorStateLoading extends GetColorState {}

class GetColorStateSuccess extends GetColorState {
  final List<ColorEntity> colors;

  GetColorStateSuccess({required this.colors});
}

class GetColorStateError extends GetColorState {
  final String message;

  GetColorStateError({required this.message});
}

class GetColorStateInitial extends GetColorState {}
