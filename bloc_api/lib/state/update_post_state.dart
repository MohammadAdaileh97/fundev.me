import '../model/post_model.dart';

abstract class UpdatePostState {}

class UpdatePostStateInitial extends UpdatePostState {}

class UpdatePostStateLoading extends UpdatePostState {}

class UpdatePostStateLoaded extends UpdatePostState {
  final PostModel post;

  UpdatePostStateLoaded({required this.post});
}

class UpdatePostStateError extends UpdatePostState {
  final String message;

  UpdatePostStateError({required this.message});
}
