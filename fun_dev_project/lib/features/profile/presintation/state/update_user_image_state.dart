import 'package:fun_dev_project/features/profile/domain/entity/response_entity.dart';

abstract class UpdateUserImageState {}

class UpdateUserImageStateLoading extends UpdateUserImageState {}

class UpdateUserImageStateSuccess extends UpdateUserImageState {
  final ResponseEntity responseEntity;

  UpdateUserImageStateSuccess({required this.responseEntity});
}

class UpdateUserImageError extends UpdateUserImageState {
  final String message;

  UpdateUserImageError({required this.message});
}

class UpdateUserImageStateInitial extends UpdateUserImageState {}
