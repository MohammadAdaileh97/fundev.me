import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/features/auth/domain/use_case/forgot_password_use_case.dart';
import 'package:fun_dev_project/features/auth/domain/use_case/login_use_case.dart';

import '../../domain/use_case/update_password_use_case.dart';
import '../state/forgot_password_state.dart';
import '../state/login_state.dart';
import '../state/update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordUseCase forgotPasswordUseCase;

  UpdatePasswordCubit({required this.forgotPasswordUseCase})
    : super(UpdatePasswordStateInitial());

  updatePassword({required String id, required String password}) async {
    emit(UpdatePasswordStateLoading());
    await forgotPasswordUseCase
        .call(password: password, id: id)
        .then(
          (value) {
            if (value.result!) {
              emit(UpdatePasswordStateSuccess(authEntity: value));
            } else {
              emit(UpdatePasswordStateError(errorMessage: value.msg!));
            }
          },
          onError: (error) {
            emit(UpdatePasswordStateError(errorMessage: error.toString()));
          },
        );
  }
}
