import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/core/utl/constant_values.dart';
import 'package:fun_dev_project/core/utl/secure_storage_helper.dart';
import 'package:fun_dev_project/features/auth/domain/use_case/login_use_case.dart';

import '../../domain/entity/auth_entity.dart';
import '../state/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(LoginStateInitial());

  loginWithSocialAccount({required String provider}) async {
    final providerName = provider.trim().toLowerCase();
    final email =
        providerName == 'google'
            ? 'google-user@demo.com'
            : 'facebook-user@demo.com';

    await login(email: email, password: 'social-login');
  }

  login({required String email, required String password}) async {
    emit(LoginStateLoading());
    await loginUseCase
        .call(email: email, password: password)
        .then(
          (value) {
            if (value.result!) {
              SecureStorageHelper().savePrefString(
                key: ConstantValues.id,
                value: value.id!,
              );
              SecureStorageHelper().savePrefString(
                key: ConstantValues.name,
                value: value.name!,
              );
              SecureStorageHelper().savePrefString(
                key: ConstantValues.email,
                value: value.email!,
              );
              SecureStorageHelper().savePrefString(
                key: ConstantValues.imageUrl,
                value: value.imageUrl!,
              );

              emit(LoginStateSuccess(authEntity: value));
            } else {
              emit(LoginStateError(errorMessage: value.msg!));
            }
          },
          onError: (error) {
            emit(LoginStateError(errorMessage: error.toString()));
          },
        );
  }

  getFromPref() async {
    emit(LoginStateLoading());
    String id = await SecureStorageHelper().getPrefString(
      key: ConstantValues.id,
      defaultValue: "",
    );
    String name = await SecureStorageHelper().getPrefString(
      key: ConstantValues.name,
      defaultValue: "",
    );
    String email = await SecureStorageHelper().getPrefString(
      key: ConstantValues.email,
      defaultValue: "",
    );
    String imageUrl = await SecureStorageHelper().getPrefString(
      key: ConstantValues.imageUrl,
      defaultValue: "",
    );

    if (id.isNotEmpty) {
      emit(
        LoginStateSuccess(
          authEntity: AuthEntity(
            id: id,
            name: name,
            email: email,
            imageUrl: imageUrl,
            msg: "",
            result: true,
            otp: null,
          ),
        ),
      );
    }
  }

  logout() async {
    emit(LogoutState());
    await SecureStorageHelper().remove(key: ConstantValues.id);
    await SecureStorageHelper().remove(key: ConstantValues.name);
    await SecureStorageHelper().remove(key: ConstantValues.email);
    await SecureStorageHelper().remove(key: ConstantValues.imageUrl);
    emit(LoginStateInitial());
  }
}
