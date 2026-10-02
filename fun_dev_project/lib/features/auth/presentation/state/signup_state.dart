import 'package:fun_dev_project/features/auth/domain/entity/auth_entity.dart';

abstract class SignUpState {}

class SignUpStateInitial extends SignUpState {}

class SignUpStateLoading extends SignUpState {}

class SignUpStateSuccess extends SignUpState {
  AuthEntity authEntity;

  SignUpStateSuccess({required this.authEntity});
}

class SignUpStateError extends SignUpState {
  String errorMessage;

  SignUpStateError({required this.errorMessage});
}
