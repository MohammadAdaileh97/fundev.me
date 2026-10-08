import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_dev_project/features/home/domain/use_case/get_ads_use_case.dart';

import '../state/get_ads_state.dart';

class GetAdsCubit extends Cubit<GetAdsState> {
  GetAdsUseCase getAdsUseCase;

  GetAdsCubit({required this.getAdsUseCase}) : super(GetAdsStateInitial());

  fetchAds() async {
    emit(GetAdsStateLoading());
    await getAdsUseCase.call().then(
      (value) {
        emit(GetAdsStateSuccess(ads: value));
      },
      onError: (error) {
        emit(GetAdsStateError(message: error.toString()));
      },
    );
  }
}
