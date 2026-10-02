import 'dart:convert';

import 'package:bloc_clean/featers/post/domain/use_case/update_post_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/post_model.dart';
import '../state/update_post_state.dart';

class UpdatePostCubit extends Cubit<UpdatePostState> {
  UpdatePostUseCase updatePostUseCase;

  UpdatePostCubit({required this.updatePostUseCase})
    : super(UpdatePostStateInitial());

  updatePost({
    required String title,
    required String body,
    required int userId,
    required int id,
  }) async {
    emit(UpdatePostStateLoading());
    try {
      await updatePostUseCase
          .call(
            postModel: PostModel(
              userId: userId,
              title: title,
              body: body,
              id: id,
            ),
          )
          .then(
            (post) {
              emit(UpdatePostStateLoaded(post: post));
            },
            onError: (error) {
              emit(UpdatePostStateError(message: error.toString()));
            },
          );
    } catch (error) {
      emit(UpdatePostStateError(message: error.toString()));
    }
  }
}
