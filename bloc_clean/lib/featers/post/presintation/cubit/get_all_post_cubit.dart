import 'package:bloc_clean/featers/post/domain/use_case/get_all_post_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/post_model.dart';
import '../state/get_all_posts_state.dart';

class GetAllPostCubit extends Cubit<GetAllPostsState> {
  GetAllPostUseCase getAllPostUseCase;

  GetAllPostCubit({required this.getAllPostUseCase})
    : super(GetAllPostInitialState());

  getAllPost() async {
    await getAllPostUseCase
        .call()
        .then((posts) {
          emit(GetAllPostSuccessState(posts: posts));
        })
        .catchError((error) {
          emit(GetAllPostErrorState(message: error.toString()));
        });
  }

  addToList({required PostModel post}) {
    if (state is GetAllPostSuccessState) {
      (state as GetAllPostSuccessState).posts.add(post);
    }

    emit(
      GetAllPostSuccessState(posts: (state as GetAllPostSuccessState).posts),
    );
  }

  updateList({required PostModel post, required int index}) {
    if (state is GetAllPostSuccessState) {
      (state as GetAllPostSuccessState).posts[index] = post;
    }

    emit(
      GetAllPostSuccessState(posts: (state as GetAllPostSuccessState).posts),
    );
  }

  updateLoadingList({required int index}) {
    if (state is GetAllPostSuccessState) {
      (state as GetAllPostSuccessState).posts[index].isLoading = true;
    }
    emit(
      GetAllPostSuccessState(posts: (state as GetAllPostSuccessState).posts),
    );
  }

  deleteList({required int index}) {
    if (state is GetAllPostSuccessState) {
      (state as GetAllPostSuccessState).posts.removeAt(index);
    }
    emit(
      GetAllPostSuccessState(posts: (state as GetAllPostSuccessState).posts),
    );
  }
}
