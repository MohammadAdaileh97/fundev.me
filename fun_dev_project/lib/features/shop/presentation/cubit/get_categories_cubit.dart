import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_case/get_category_use_case.dart';
import '../state/get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoryUseCase getCategoryUseCase;

  GetCategoriesCubit({required this.getCategoryUseCase})
    : super(GetCategoriesStateInitial());

  fetchCategories() async {
    emit(GetCategoriesStateLoading());
    try {
      await getCategoryUseCase.call().then(
        (value) {
          emit(GetCategoriesStateSuccess(categories: value));
        },
        onError: (error) {
          emit(GetCategoriesStateError(message: error.toString()));
        },
      );
    } catch (e) {
      emit(GetCategoriesStateError(message: e.toString()));
    }
  }
}
