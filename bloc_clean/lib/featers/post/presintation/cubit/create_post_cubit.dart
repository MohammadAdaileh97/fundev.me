import 'package:bloc_clean/featers/post/data/model/post_model.dart';
import 'package:bloc_clean/featers/post/domain/use_case/create_post_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostUseCase createPostUseCase;

  CreatePostCubit({required this.createPostUseCase})
    : super(CreatePostStateInitial());

  createPost({
    required String title,
    required String body,
    required int userId,
  }) async {
    emit(CreatePostStateLoading());
    await createPostUseCase
        .call(postModel: PostModel(userId: userId, title: title, body: body))
        .then(
          (post) {
            emit(CreatePostStateLoaded(post: post));
          },
          onError: (error) {
            emit(CreatePostStateError(message: error.toString()));
          },
        );
  }
}
