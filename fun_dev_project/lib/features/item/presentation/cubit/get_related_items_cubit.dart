import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/features/item/domain/use_case/get_related_items_use_case.dart';
import 'package:fun_dev_project/features/item/presentation/state/get_related_items_state.dart';

import '../../../../core/utl/constant_values.dart';
import '../../../../core/utl/secure_storage_helper.dart';

class GetRelatedItemsCubit extends Cubit<GetRelatedItemsState> {
  GetRelatedItemsUseCase getRelatedItemsUseCase;

  GetRelatedItemsCubit({required this.getRelatedItemsUseCase})
    : super(GEtItemsStateInitial());

  fetchRelatedItems({required String idItem}) async {
    emit(GetRelatedItemsStateLoading());
    try {
      String userId = await SecureStorageHelper().getPrefString(
        key: ConstantValues.id,
        defaultValue: "",
      );

      await getRelatedItemsUseCase
          .call(idItem: idItem, userId: userId)
          .then(
            (items) {
              emit(GetRelatedItemsStateSuccess(items: items));
            },
            onError: (error) {
              emit(GetRelatedItemsStateError(message: error.toString()));
            },
          );
    } catch (e) {
      emit(GetRelatedItemsStateError(message: e.toString()));
    }
  }
  changeFav({required String idItem}) async {
    var state = this.state;
    emit(GetRelatedItemsStateLoading());
    if (state is GetRelatedItemsStateSuccess) {
      for (var element in state.items) {
        if (element.id == idItem) {
          element.isFavorite = !element.isFavorite!;
        }
      }
      emit(GetRelatedItemsStateSuccess(items: state.items));
    }
  }
}
