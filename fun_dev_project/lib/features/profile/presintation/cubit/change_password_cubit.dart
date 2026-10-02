import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/core/utl/constant_values.dart';
import 'package:fun_dev_project/core/utl/secure_storage_helper.dart';
import 'package:fun_dev_project/features/profile/domain/use_case/change_password_use_case.dart';

import '../state/change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordUseCase changePasswordUseCase;

  ChangePasswordCubit({required this.changePasswordUseCase})
    : super(ChangePasswordStateInitial());

  changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,

    required String errorMsgOldPassword,
    required String errorMsgNewPassword,
    required String errorMsgConfirmPassword,
  }) async {
    emit(ChangePasswordStateLoading());
    try {
      if (oldPassword.isEmpty) {
        emit(ChangePasswordStateError(message: errorMsgOldPassword));
        return;
      }
      if (newPassword.isEmpty) {
        emit(ChangePasswordStateError(message: errorMsgNewPassword));
        return;
      }

      if (confirmPassword != newPassword) {
        emit(ChangePasswordStateError(message: errorMsgConfirmPassword));
        return;
      }

      String userId = await SecureStorageHelper().getPrefString(
        key: ConstantValues.id,
        defaultValue: "",
      );
      await changePasswordUseCase
          .changePassword(
            userId: userId,
            oldPassword: oldPassword,
            newPassword: newPassword,
          )
          .then(
            (value) {
              if (value.result!) {
                emit(ChangePasswordStateSuccess(responseEntity: value));
              } else {
                emit(ChangePasswordStateError(message: value.msg!));
              }
            },
            onError: (error) {
              emit(ChangePasswordStateError(message: error.toString()));
            },
          );
    } catch (e) {
      emit(ChangePasswordStateError(message: e.toString()));
    }
  }
}
