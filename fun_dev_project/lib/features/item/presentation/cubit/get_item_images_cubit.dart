import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/features/item/domain/use_case/get_item_images_use_case.dart';

import '../state/get_item_images_state.dart';

class GetItemImagesCubit extends Cubit<GetItemImagesState> {
  GetItemImagesUseCase getItemImagesUseCase;

  GetItemImagesCubit({required this.getItemImagesUseCase})
    : super(GetItemImagesStateInitial());

  fetchItemImages({required String idItem}) {
    emit(GetItemImagesStateLoading());
    getItemImagesUseCase
        .call(idItem: idItem)
        .then(
          (images) {
            emit(GetItemImagesStateSuccess(images: images));
          },
          onError: (error) {
            emit(GetItemImagesStateError(message: error.toString()));
          },
        );
  }
}
