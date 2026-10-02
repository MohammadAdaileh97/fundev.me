import 'package:fun_dev_project/features/profile/domain/repository/profile_repository.dart';
import 'package:http/http.dart';

import '../entity/response_entity.dart';

class ChangePasswordUseCase {
  ProfileRepository profileRepository;

  ChangePasswordUseCase({required this.profileRepository});

  Future<ResponseEntity> changePassword({
    required String oldPassword,
    required String newPassword,
    required String userId,
  }) async {
    return await profileRepository.changePassword(
      userId: userId,
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }
}
