import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/features/cart/domain/use_case/add_to_cart_use_case.dart';

import '../../../../core/utl/constant_values.dart';
import '../../../../core/utl/secure_storage_helper.dart';
import '../state/add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartUseCase addToCartUseCase;

  AddToCartCubit({required this.addToCartUseCase})
    : super(AddToCartStateInitial());

  addToCart({
    required String itemId,
    required String sizeId,
    required String colorId,
    required String quantity,
  }) async {
    emit(AddToCartStateLoading());
    try {
      final userId = await SecureStorageHelper().getPrefString(
        key: ConstantValues.id,
        defaultValue: "",
      );

      await addToCartUseCase
          .call(
            userId: userId,
            itemId: itemId,
            sizeId: sizeId,
            colorId: colorId,
            quantity: quantity,
          )
          .then(
            (value) {
              emit(AddToCartStateSuccess(cartEntity: value));
            },
            onError: (error) {
              emit(AddToCartStateError(message: error.toString()));
            },
          );
    } catch (e) {
      emit(AddToCartStateError(message: e.toString()));
    }
  }
}
