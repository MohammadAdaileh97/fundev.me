import '../entity/auth_entity.dart';

abstract class AuthRepository {
  Future<AuthEntity> login({required String email, required String password});

  Future<AuthEntity> signup({
    required String email,
    required String password,
    required String name,
  });

  Future<AuthEntity> forgotPassword({required String email});

  Future<AuthEntity> updatePassword({
    required String id,
    required String password,
  });
}
