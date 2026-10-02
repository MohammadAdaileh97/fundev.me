import 'package:fun_dev_project/features/profile/domain/repository/profile_repository.dart';
import 'package:http/http.dart';

import '../entity/response_entity.dart';

class UpdateUserImageUseCase {
  ProfileRepository profileRepository;

  UpdateUserImageUseCase({required this.profileRepository});

  Future<ResponseEntity> updateUserImage({
    required MultipartFile file,
    required String userId,
  }) async {
    return await profileRepository.updateUserImage(
      file: file,
      userId: userId,
    );
  }
}
