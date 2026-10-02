import 'package:api_clean/featers/posts/domain/use_case/create_post_use_case.dart';
import 'package:api_clean/featers/posts/presintation/state/create_post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostUseCase createPostUseCase;

  CreatePostCubit({required this.createPostUseCase})
    : super(CreatePostInitial());

  createPost({
    required String title,
    required String body,
    required int userId,
  }) {
    emit(CreatePostStateLoading());
    createPostUseCase
        .call(title: title, body: body, userId: userId)
        .then((post) {
          emit(CreatePostStateSuccess(post: post));
        })
        .catchError((error) {
          emit(CreatePostStateError(error: error.toString()));
        });
  }
}
