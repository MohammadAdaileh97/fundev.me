abstract class DeletePostState {}

class DeletePostStateLoading extends DeletePostState {}

class DeletePostStateInitial extends DeletePostState {}

class DeletePostStateLoaded extends DeletePostState {}

class DeletePostStateError extends DeletePostState {
  final String message;

  DeletePostStateError({required this.message});
}
