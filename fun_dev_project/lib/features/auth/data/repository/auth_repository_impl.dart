import 'package:fun_dev_project/features/auth/data/data_source/auth_data_source.dart';
import 'package:fun_dev_project/features/auth/domain/entity/auth_entity.dart';
import 'package:fun_dev_project/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthDataSource authDataSource;

  AuthRepositoryImpl({required this.authDataSource});

  @override
  Future<AuthEntity> login({
    required String email,
    required String password,
  }) async {
    return await authDataSource.login(email: email, password: password);
  }

  @override
  Future<AuthEntity> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    return await authDataSource.signup(
      email: email,
      password: password,
      name: name,
    );
  }

  @override
  Future<AuthEntity> forgotPassword({required String email}) async {
    return await authDataSource.forgotPassword(email: email);
  }

  @override
  Future<AuthEntity> updatePassword({
    required String id,
    required String password,
  }) async {
    return await authDataSource.updatePassword(id: id, password: password);
  }
}
