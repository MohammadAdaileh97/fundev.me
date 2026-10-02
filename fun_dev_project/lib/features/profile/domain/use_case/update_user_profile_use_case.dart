import 'package:fun_dev_project/features/profile/domain/repository/profile_repository.dart';
import 'package:http/http.dart';

import '../entity/response_entity.dart';

class UpdateUserProfileUseCase {
  ProfileRepository profileRepository;

  UpdateUserProfileUseCase({required this.profileRepository});

  Future<ResponseEntity> updateProfile({
    required String name,
    required String userId,
    required String email,
  }) async {
    return await profileRepository.updateProfile(
      name: name,
      userId: userId,
      email: email,
    );
  }
}
