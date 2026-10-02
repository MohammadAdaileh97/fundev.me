import 'package:fun_dev_project/features/auth/domain/entity/auth_entity.dart';

abstract class UpdatePasswordState {}

class UpdatePasswordStateInitial extends UpdatePasswordState {}

class UpdatePasswordStateLoading extends UpdatePasswordState {}

class UpdatePasswordStateSuccess extends UpdatePasswordState {
  AuthEntity authEntity;

  UpdatePasswordStateSuccess({required this.authEntity});
}

class UpdatePasswordStateError extends UpdatePasswordState {
  String errorMessage;

  UpdatePasswordStateError({required this.errorMessage});
}
