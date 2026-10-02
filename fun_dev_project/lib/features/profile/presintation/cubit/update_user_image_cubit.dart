import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/core/utl/constant_values.dart';
import 'package:fun_dev_project/core/utl/secure_storage_helper.dart';
import 'package:fun_dev_project/features/profile/domain/use_case/update_user_image_use_case.dart';

import 'package:image_picker/image_picker.dart';

import '../state/update_user_image_state.dart';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class UpdateUserImageCubit extends Cubit<UpdateUserImageState> {
  UpdateUserImageUseCase updateUserImageUseCase;

  UpdateUserImageCubit({required this.updateUserImageUseCase})
    : super(UpdateUserImageStateInitial());

  updateUserImage({required XFile file}) async {
    emit(UpdateUserImageStateLoading());

    String userId = await SecureStorageHelper().getPrefString(
      key: ConstantValues.id,
      defaultValue: "",
    );

    var stream = http.ByteStream(Stream.castFrom(file.openRead()));
    var length = await file.length();
    http.MultipartFile multipartFile = http.MultipartFile(
      'fileToUpload',
      stream,
      length,
      filename: basename(file.path),
    );

    await updateUserImageUseCase
        .updateUserImage(file: multipartFile, userId: userId)
        .then(
          (value) {
            if (value.result == true) {
              SecureStorageHelper().savePrefString(
                key: ConstantValues.imageUrl,
                value: value.imageUrl ?? "",
              );
            }

            emit(UpdateUserImageStateSuccess(responseEntity: value));
          },
          onError: (error) {
            emit(UpdateUserImageError(message: error.toString()));
          },
        );
  }
}
