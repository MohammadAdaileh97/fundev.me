
import '../../data/model/post_model.dart';

abstract class CreatePostState {}

class CreatePostStateLoading extends CreatePostState {}

class CreatePostStateInitial extends CreatePostState {}

class CreatePostStateLoaded extends CreatePostState {
  final PostModel post;

  CreatePostStateLoaded({required this.post});
}

class CreatePostStateError extends CreatePostState {
  final String message;

  CreatePostStateError({required this.message});
}
