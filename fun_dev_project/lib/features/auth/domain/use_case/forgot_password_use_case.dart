import 'package:fun_dev_project/features/auth/domain/entity/auth_entity.dart';
import 'package:fun_dev_project/features/auth/domain/repository/auth_repository.dart';

class ForgotPasswordUseCase {
  AuthRepository authRepository;

  ForgotPasswordUseCase({required this.authRepository});

  Future<AuthEntity> call({required String email}) async {
    return await authRepository.forgotPassword(email: email);
  }
}
