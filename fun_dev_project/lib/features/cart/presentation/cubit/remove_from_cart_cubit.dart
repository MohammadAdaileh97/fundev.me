import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/features/cart/domain/use_case/remove_from_cart_use_case.dart';
import 'package:fun_dev_project/features/cart/presentation/state/remove_from_cart_state.dart';

import '../../../../core/utl/constant_values.dart';
import '../../../../core/utl/secure_storage_helper.dart';

class RemoveFromCartCubit extends Cubit<RemoveFromCartState> {
  RemoveFromCartUseCase removeFromCartUseCase;

  RemoveFromCartCubit({required this.removeFromCartUseCase})
    : super(RemoveFromCartStateInitial());

  addToCart({
    required String itemId,
    required String sizeId,
    required String colorId,
    required String quantity,
  }) async {
    emit(RemoveFromCartStateLoading());
    try {
      final userId = await SecureStorageHelper().getPrefString(
        key: ConstantValues.id,
        defaultValue: "",
      );

      await removeFromCartUseCase
          .call(
            userId: userId,
            itemId: itemId,
            sizeId: sizeId,
            colorId: colorId,
          )
          .then(
            (value) {
              emit(RemoveFromCartStateSuccess(cartEntity: value));
            },
            onError: (error) {
              emit(RemoveFromCartStateError(message: error.toString()));
            },
          );
    } catch (e) {
      emit(RemoveFromCartStateError(message: e.toString()));
    }
  }
}
