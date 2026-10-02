import '../../domain/entity/size_entity.dart';

abstract class GetSizeState {}

class GetSizeStateLoading extends GetSizeState {}

class GetSizeStateSuccess extends GetSizeState {
  final List<SizeEntity> sizes;

  GetSizeStateSuccess({required this.sizes});
}

class GetSizeStateError extends GetSizeState {
  final String message;

  GetSizeStateError({required this.message});
}

class GetSizeStateInitial extends GetSizeState {}
