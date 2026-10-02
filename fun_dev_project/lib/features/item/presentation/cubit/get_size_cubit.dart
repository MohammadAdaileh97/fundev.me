import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/features/item/domain/use_case/get_size_use_case.dart';

import '../state/get_size_state.dart';

class GetSizeCubit extends Cubit<GetSizeState> {
  GetSizeUseCase getSizeUseCase;

  GetSizeCubit({required this.getSizeUseCase}) : super(GetSizeStateInitial());

  fetchSize() async {
    emit(GetSizeStateLoading());
    try {
      await getSizeUseCase.call().then(
        (sizes) {
          emit(GetSizeStateSuccess(sizes: sizes));
        },
        onError: (error) {
          emit(GetSizeStateError(message: error.toString()));
        },
      );
    } catch (e) {
      emit(GetSizeStateError(message: e.toString()));
    }
  }
}
