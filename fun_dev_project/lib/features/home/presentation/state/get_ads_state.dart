import 'package:fun_dev_project/features/home/domain/entity/ads_entity.dart';

abstract class GetAdsState {}

class GetAdsStateLoading extends GetAdsState {}

class GetAdsStateSuccess extends GetAdsState {
  List<AdsEntity> ads;

  GetAdsStateSuccess({required this.ads});
}

class GetAdsStateError extends GetAdsState {
  String message;

  GetAdsStateError({required this.message});
}

class GetAdsStateInitial extends GetAdsState {}
