import '../../data/model/post_model.dart';

abstract class GetAllPostState {}

class GetAllPostStateLoading extends GetAllPostState {}

class GetAllPostStateSuccess extends GetAllPostState {
  final List<PostModel> posts;

  GetAllPostStateSuccess({required this.posts});
}

class GetAllPostStateError extends GetAllPostState {
  final String error;

  GetAllPostStateError({required this.error});
}

class GetAllPostInitial extends GetAllPostState {}
