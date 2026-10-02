import '../../data/model/post_model.dart';

abstract class CreatePostState {}

class CreatePostStateLoading extends CreatePostState {}

class CreatePostStateSuccess extends CreatePostState {
  final PostModel post;

  CreatePostStateSuccess({required this.post});
}

class CreatePostStateError extends CreatePostState {
  final String error;

  CreatePostStateError({required this.error});
}

class CreatePostInitial extends CreatePostState {}
