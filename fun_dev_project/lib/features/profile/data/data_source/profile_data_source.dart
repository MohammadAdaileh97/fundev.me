import 'package:fun_dev_project/core/network/api_client.dart';
import 'package:fun_dev_project/features/profile/domain/entity/response_entity.dart';
import 'package:http/http.dart';

import '../model/response_model.dart';

abstract class ProfileDataSource {
  Future<ResponseEntity> updateUserImage({
    required MultipartFile file,
    required String userId,
  });

  Future<ResponseEntity> changePassword({
    required String oldPassword,
    required String newPassword,
    required String userId,
  });

  Future<ResponseEntity> updateProfile({
    required String name,
    required String userId,
    required String email,
  });
}

class ProfileDataSourceImpl implements ProfileDataSource {
  @override
  Future<ResponseEntity> updateUserImage({
    required MultipartFile file,
    required String userId,
  }) {
    final request = ApiClient.postMultiPartData(
      fields: {"Id": userId},
      endPoint: "updateUserImage.php",
      files: [file],
      fromJsonT: (data) => ResponseModel.fromJson(json: data),
    );
    return request;
  }

  @override
  Future<ResponseEntity> changePassword({
    required String oldPassword,
    required String newPassword,
    required String userId,
  }) {
    final request = ApiClient.postData(
      endPoint: "ChangePassword.php",
      body: {
        "Id": userId,
        "OldPassword": oldPassword,
        "NewPassword": newPassword,
      },
      fromJsonT: (data) => ResponseModel.fromJson(json: data),
    );
    return request;
  }

  @override
  Future<ResponseEntity> updateProfile({
    required String name,
    required String userId,
    required String email,
  }) {
    final request = ApiClient.postData(
      endPoint: "UpdateProfile.php",
      body: {"Id": userId, "Name": name, "Email": email},
      fromJsonT: (data) => ResponseModel.fromJson(json: data),
    );
    return request;
  }
}
