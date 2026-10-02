import '../model/comments_model.dart';

abstract class GetCommentsState {}

class GetCommentsStateLoading extends GetCommentsState {}

class GetCommentsStateInitial extends GetCommentsState {}

class GetCommentsStateLoaded extends GetCommentsState {
  final List<CommentsModel> comments;

  GetCommentsStateLoaded({required this.comments});
}

class GetCommentsStateError extends GetCommentsState {
  final String message;

  GetCommentsStateError({required this.message});
}
