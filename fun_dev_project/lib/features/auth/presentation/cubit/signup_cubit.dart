import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/features/auth/domain/use_case/login_use_case.dart';
import 'package:fun_dev_project/features/auth/domain/use_case/signup_use_case.dart';
import 'package:fun_dev_project/features/auth/presentation/state/signup_state.dart';

import '../state/login_state.dart';

class SignupCubit extends Cubit<SignUpState> {
  SignupUseCase signupUseCase;

  SignupCubit({required this.signupUseCase}) : super(SignUpStateInitial());

  signup({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignUpStateLoading());
    await signupUseCase
        .call(email: email, password: password, name: name)
        .then(
          (value) {
            if (value.result!) {
              emit(SignUpStateSuccess(authEntity: value));
            } else {
              emit(SignUpStateError(errorMessage: value.msg!));
            }
          },
          onError: (error) {
            emit(SignUpStateError(errorMessage: error.toString()));
          },
        );
  }
}
