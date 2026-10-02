import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/features/item/domain/use_case/get_color_use_case.dart';

import '../state/get_color_state.dart';

class GetColorsCubit extends Cubit<GetColorState> {
  GetColorUseCase getColorUseCase;

  GetColorsCubit({required this.getColorUseCase})
    : super(GetColorStateInitial());

  fetchColors() async {
    emit(GetColorStateLoading());
    try {
      await getColorUseCase.call().then(
        (colors) {
          emit(GetColorStateSuccess(colors: colors));
        },
        onError: (error) {
          emit(GetColorStateError(message: error.toString()));
        },
      );
    } catch (e) {
      emit(GetColorStateError(message: e.toString()));
    }
  }
}
