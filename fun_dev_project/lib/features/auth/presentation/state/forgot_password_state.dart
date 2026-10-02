import 'package:fun_dev_project/features/auth/domain/entity/auth_entity.dart';

abstract class ForgotPasswordState {}

class ForgotPasswordStateInitial extends ForgotPasswordState {}

class ForgotPasswordStateLoading extends ForgotPasswordState {}

class ForgotPasswordStateSuccess extends ForgotPasswordState {
  AuthEntity authEntity;

  ForgotPasswordStateSuccess({required this.authEntity});
}

class ForgotPasswordStateError extends ForgotPasswordState {
  String errorMessage;

  ForgotPasswordStateError({required this.errorMessage});
}
