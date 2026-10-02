import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/core/utl/constant_values.dart';
import 'package:fun_dev_project/core/utl/secure_storage_helper.dart';
import 'package:fun_dev_project/features/item/domain/use_case/get_items_use_case.dart';

import '../state/get_items_state.dart';

class GetItemsCubit extends Cubit<GetItemsState> {
  GetItemsUseCase getItemsUseCase;

  GetItemsCubit({required this.getItemsUseCase})
    : super(GEtItemsStateInitial());

  fetchItems({required String idCategory}) async {
    emit(GetItemsStateLoading());
    try {
      String userId = await SecureStorageHelper().getPrefString(
        key: ConstantValues.id,
        defaultValue: "",
      );
      await getItemsUseCase
          .call(idCategory: idCategory, userId: userId)
          .then(
            (value) {
              emit(GetItemsStateSuccess(items: value));
            },
            onError: (error) {
              emit(GetItemsStateError(message: error.toString()));
            },
          );
    } catch (e) {
      emit(GetItemsStateError(message: e.toString()));
    }
  }

  changeFav({required String idItem}) async {
    var state = this.state;
    emit(GetItemsStateLoading());
    if (state is GetItemsStateSuccess) {
      for (var element in state.items) {
        if (element.id == idItem) {
          element.isFavorite = !element.isFavorite!;
        }
      }
      emit(GetItemsStateSuccess(items: state.items));
    }
  }
}
