import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/features/auth/domain/use_case/forgot_password_use_case.dart';

import '../state/forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordUseCase forgotPasswordUseCase;

  ForgotPasswordCubit({required this.forgotPasswordUseCase})
    : super(ForgotPasswordStateInitial());

  forgotPassword({required String email}) async {
    emit(ForgotPasswordStateLoading());
    await forgotPasswordUseCase
        .call(email: email)
        .then(
          (value) {
            if (value.result!) {
              emit(ForgotPasswordStateSuccess(authEntity: value));
            } else {
              emit(ForgotPasswordStateError(errorMessage: value.msg!));
            }
          },
          onError: (error) {
            emit(ForgotPasswordStateError(errorMessage: error.toString()));
          },
        );
  }
}
