import 'package:http/http.dart';

import '../entity/response_entity.dart';

abstract class ProfileRepository {
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
