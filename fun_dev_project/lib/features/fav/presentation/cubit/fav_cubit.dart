import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/core/utl/constant_values.dart';
import 'package:fun_dev_project/core/utl/secure_storage_helper.dart';
import 'package:fun_dev_project/features/fav/domain/use_case/fav_use_case.dart';

import '../state/fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavUseCase favUseCase;

  FavCubit({required this.favUseCase}) : super(FavStateInitial());

  Future<void> fav({required String idItem}) async {
    emit(FavStateLoading());
    try {
      final userId = await SecureStorageHelper().getPrefString(
        key: ConstantValues.id,
        defaultValue: "",
      );
      await favUseCase
          .call(idItem: idItem, userId: userId)
          .then(
            (value) {
              emit(FavStateSuccess(favEntity: value));
            },
            onError: (error) {
              emit(FavStateError(msg: error.toString()));
            },
          );
    } catch (e) {
      emit(FavStateError(msg: e.toString()));
    }
  }
}
