import '../../domain/entity/category_entity.dart';

abstract class GetCategoriesState {}

class GetCategoriesStateLoading extends GetCategoriesState {}

class GetCategoriesStateSuccess extends GetCategoriesState {
  final List<CategoryEntity> categories;

  GetCategoriesStateSuccess({required this.categories});
}

class GetCategoriesStateError extends GetCategoriesState {
  final String message;

  GetCategoriesStateError({required this.message});
}

class GetCategoriesStateInitial extends GetCategoriesState {}
