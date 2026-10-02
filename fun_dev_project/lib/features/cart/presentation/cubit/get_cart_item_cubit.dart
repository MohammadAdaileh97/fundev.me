import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/features/cart/domain/use_case/add_to_cart_use_case.dart';
import 'package:fun_dev_project/features/cart/domain/use_case/get_cart_item_use_case.dart';
import 'package:fun_dev_project/features/cart/presentation/state/get_cart_item_state.dart';

import '../../../../core/utl/constant_values.dart';
import '../../../../core/utl/secure_storage_helper.dart';
import '../state/add_to_cart_state.dart';

class GetCartItemCubit extends Cubit<GetCartItemState> {
  GetCartItemUseCase getCartItemUseCase;

  GetCartItemCubit({required this.getCartItemUseCase})
    : super(GetCartItemStateInitial());

  addToCart({
    required String itemId,
    required String sizeId,
    required String colorId,
    required String quantity,
  }) async {
    emit(GetCartItemStateLoading());
    try {
      final userId = await SecureStorageHelper().getPrefString(
        key: ConstantValues.id,
        defaultValue: "",
      );

      await getCartItemUseCase
          .call(userId: userId)
          .then(
            (value) {
              emit(GetCartItemStateSuccess(items: value));
            },
            onError: (error) {
              emit(GetCartItemStateError(message: error.toString()));
            },
          );
    } catch (e) {
      emit(GetCartItemStateError(message: e.toString()));
    }
  }
}
