import 'package:fun_dev_project/features/profile/data/data_source/profile_data_source.dart';
import 'package:fun_dev_project/features/profile/domain/entity/response_entity.dart';

import 'package:http/http.dart' show MultipartFile;

import '../../domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileDataSource profileDataSource;

  ProfileRepositoryImpl({required this.profileDataSource});

  @override
  Future<ResponseEntity> updateUserImage({
    required MultipartFile file,
    required String userId,
  }) async {
    return await profileDataSource.updateUserImage(file: file, userId: userId);
  }

  @override
  Future<ResponseEntity> changePassword({
    required String oldPassword,
    required String newPassword,
    required String userId,
  }) async {
    return await profileDataSource.changePassword(
      userId: userId,
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }

  @override
  Future<ResponseEntity> updateProfile({
    required String name,
    required String userId,
    required String email,
  }) async {
    return await profileDataSource.updateProfile(
      name: name,
      userId: userId,
      email: email,
    );
  }
}
