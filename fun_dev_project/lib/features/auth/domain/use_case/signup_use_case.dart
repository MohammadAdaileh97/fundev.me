import 'package:fun_dev_project/features/auth/domain/entity/auth_entity.dart';
import 'package:fun_dev_project/features/auth/domain/repository/auth_repository.dart';

class SignupUseCase {
  AuthRepository authRepository;

  SignupUseCase({required this.authRepository});

  Future<AuthEntity> call({
    required String email,
    required String password,
    required String name,
  }) async {
    return await authRepository.signup(
      email: email,
      password: password,
      name: name,
    );
  }
}
