import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/features/profile/domain/use_case/update_user_profile_use_case.dart';

import '../../../../core/utl/constant_values.dart';
import '../../../../core/utl/secure_storage_helper.dart';
import '../state/update_user_profile_state.dart';

class UpdateUserProfileCubit extends Cubit<UpdateUserProfileState> {
  UpdateUserProfileUseCase updateUserProfileUseCase;

  UpdateUserProfileCubit({required this.updateUserProfileUseCase})
    : super(UpdateUserProfileStateInitial());

  updateProfile({
    required String name,
    required String email,
    required String errorMsgEmail,
    required String errorMsgName,
  }) async {
    emit(UpdateUserProfileStateLoading());
    try {
      if (!EmailValidator.validate(email)) {
        emit(UpdateUserProfileStateError(message: errorMsgEmail));
        return;
      }
      if (name.isEmpty) {
        emit(UpdateUserProfileStateError(message: errorMsgName));
        return;
      }
      String userId = await SecureStorageHelper().getPrefString(
        key: ConstantValues.id,
        defaultValue: "",
      );
      await updateUserProfileUseCase
          .updateProfile(name: name, userId: userId, email: email)
          .then(
            (value) async {
              if (value.result!) {
                await SecureStorageHelper().savePrefString(
                  key: ConstantValues.name,
                  value: name,
                );
                await SecureStorageHelper().savePrefString(
                  key: ConstantValues.email,
                  value: email,
                );

                emit(UpdateUserProfileStateSuccess(responseEntity: value));
              } else {
                emit(UpdateUserProfileStateError(message: value.msg!));
              }
            },
            onError: (error) {
              emit(UpdateUserProfileStateError(message: error.toString()));
            },
          );
    } catch (e) {
      emit(UpdateUserProfileStateError(message: e.toString()));
    }
  }
}
