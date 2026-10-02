import 'package:fun_dev_project/features/profile/domain/entity/response_entity.dart';

abstract class UpdateUserProfileState {}

class UpdateUserProfileStateLoading extends UpdateUserProfileState {}

class UpdateUserProfileStateSuccess extends UpdateUserProfileState {
  final ResponseEntity responseEntity;

  UpdateUserProfileStateSuccess({required this.responseEntity});
}

class UpdateUserProfileStateError extends UpdateUserProfileState {
  final String message;

  UpdateUserProfileStateError({required this.message});
}

class UpdateUserProfileStateInitial extends UpdateUserProfileState {}
