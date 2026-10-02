import 'package:fun_dev_project/core/network/api_client.dart';
import 'package:fun_dev_project/features/auth/data/model/auth_model.dart';
import 'package:fun_dev_project/features/auth/domain/entity/auth_entity.dart';

abstract class AuthDataSource {
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

class AuthDataSourceImpl implements AuthDataSource {
  @override
  Future<AuthEntity> login({
    required String email,
    required String password,
  }) async {
    final response = await ApiClient.postData(
      endPoint: "Login.php",
      body: {"Email": email, "Password": password},
      fromJsonT: (data) => AuthModel.fromJson(json: data),
    );
    return response;
  }

  @override
  Future<AuthEntity> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    final response = await ApiClient.postData(
      endPoint: "SignUp.php",
      body: {"Email": email, "Password": password, "Name": name},
      fromJsonT: (data) => AuthModel.fromJson(json: data),
    );
    return response;
  }

  @override
  Future<AuthEntity> forgotPassword({required String email}) async {
    final response = await ApiClient.postData(
      endPoint: "ForgotPassword.php",
      body: {"Email": email},
      fromJsonT: (data) => AuthModel.fromJson(json: data),
    );
    return response;
  }

  @override
  Future<AuthEntity> updatePassword({
    required String id,
    required String password,
  }) async {
    final response = await ApiClient.postData(
      endPoint: "UpdatePassword.php",
      body: {"Id": id, "Password": password},
      fromJsonT: (data) => AuthModel.fromJson(json: data),
    );
    return response;
  }
}
