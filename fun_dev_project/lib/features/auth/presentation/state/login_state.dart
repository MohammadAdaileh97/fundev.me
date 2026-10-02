import 'package:fun_dev_project/features/auth/domain/entity/auth_entity.dart';

abstract class LoginState {}

class LoginStateInitial extends LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateSuccess extends LoginState {
  AuthEntity authEntity;

  LoginStateSuccess({required this.authEntity});
}

class LoginStateError extends LoginState {
  String errorMessage;

  LoginStateError({required this.errorMessage});
}

class LogoutState extends LoginState {}
