import 'package:fun_dev_project/features/profile/domain/entity/response_entity.dart';

abstract class ChangePasswordState {}

class ChangePasswordStateLoading extends ChangePasswordState {}

class ChangePasswordStateSuccess extends ChangePasswordState {
  final ResponseEntity responseEntity;

  ChangePasswordStateSuccess({required this.responseEntity});
}

class ChangePasswordStateError extends ChangePasswordState {
  final String message;

  ChangePasswordStateError({required this.message});
}

class ChangePasswordStateInitial extends ChangePasswordState {}
