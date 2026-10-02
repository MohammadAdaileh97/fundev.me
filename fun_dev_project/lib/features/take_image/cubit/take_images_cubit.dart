import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../state/take_image_state.dart';

class TakeImagesCubit extends Cubit<TakeImagesState> {
  TakeImagesCubit() : super(TakeImagesStateInitial());

  void takeImages({required bool isSingle, required ImageSource source}) async {
    emit(TakeImagesStateLoading());

    try {
      if (isSingle) {
        final XFile? image = await ImagePicker().pickImage(source: source);
        if (image != null) {
          emit(TakeImagesStateSuccess(images: [image]));
        }
      } else {
        final List<XFile> images = await ImagePicker().pickMultiImage();
        emit(TakeImagesStateSuccess(images: images));
      }
    } catch (e) {
      emit(TakeImagesStateError(message: e.toString()));
    }
  }
}
