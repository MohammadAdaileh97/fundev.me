import 'package:fun_dev_project/features/auth/domain/entity/auth_entity.dart';
import 'package:fun_dev_project/features/auth/domain/repository/auth_repository.dart';

class UpdatePasswordUseCase {
  AuthRepository authRepository;

  UpdatePasswordUseCase({required this.authRepository});

  Future<AuthEntity> call({
    required String id,
    required String password,
  }) async {
    return await authRepository.updatePassword(id: id, password: password);
  }
}
