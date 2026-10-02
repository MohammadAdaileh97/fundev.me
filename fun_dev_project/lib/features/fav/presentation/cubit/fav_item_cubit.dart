import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/core/utl/constant_values.dart';
import 'package:fun_dev_project/core/utl/secure_storage_helper.dart';
import 'package:fun_dev_project/features/fav/domain/use_case/get_fav_item_use_case.dart';

import '../state/fav_item_state.dart';

class FavItemCubit extends Cubit<FavItemState> {
  GetFavItemUseCase getFavItemUseCase;

  FavItemCubit({required this.getFavItemUseCase}) : super(FavItemInitial());

  fetchFavItems() async {
    emit(FavItemLoading());
    try {
      String userId = await SecureStorageHelper().getPrefString(
        key: ConstantValues.id,
        defaultValue: "",
      );
      await getFavItemUseCase
          .call(userId: userId)
          .then(
            (value) {
              emit(FavItemSuccess(favItemEntity: value));
            },
            onError: (error) {
              emit(FavItemError(msg: error.toString()));
            },
          );
    } catch (error) {
      emit(FavItemError(msg: error.toString()));
    }
  }

  changeFav({required String idItem}) async {
    var state = this.state;
    emit(FavItemLoading());

    if (state is FavItemSuccess) {
      state.favItemEntity.removeWhere((element) => element.id == idItem);
      emit(FavItemSuccess(favItemEntity: state.favItemEntity));
    }
  }
}
