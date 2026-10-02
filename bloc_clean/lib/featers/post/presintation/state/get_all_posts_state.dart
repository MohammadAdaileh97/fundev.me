import '../../data/model/post_model.dart';

abstract class GetAllPostsState {}

class GetAllPostInitialState extends GetAllPostsState {}

class GetAllPostLoadingState extends GetAllPostsState {}

class GetAllPostSuccessState extends GetAllPostsState {
  final List<PostModel> posts;

  GetAllPostSuccessState({required this.posts});
}

class GetAllPostErrorState extends GetAllPostsState {
  final String message;

  GetAllPostErrorState({required this.message});
}
