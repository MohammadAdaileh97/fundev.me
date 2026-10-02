import 'package:fun_dev_project/features/auth/domain/entity/auth_entity.dart';
import 'package:fun_dev_project/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<AuthEntity> call({
    required String email,
    required String password,
  }) async {
    return await authRepository.login(email: email, password: password);
  }
}
