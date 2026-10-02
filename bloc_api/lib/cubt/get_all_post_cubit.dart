import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/post_model.dart';
import '../state/get_all_posts_state.dart';
import 'package:http/http.dart' as http;

import '../utl/constant_values.dart';

class GetAllPostCubit extends Cubit<GetAllPostsState> {
  GetAllPostCubit() : super(GetAllPostInitialState());

  Future<void> getAllPosts() async {
    emit(GetAllPostLoadingState());
    try {
      final response = await http.get(
        Uri.parse('${ConstantValues.baseUrl}posts'),
      );
      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body);
        List<PostModel> posts = [];
        for (var post in jsonBody) {
          posts.add(PostModel.fromJson(post));
        }
        emit(GetAllPostSuccessState(posts: posts));
      } else {
        emit(GetAllPostErrorState(message: "Something went wrong"));
      }
    } catch (error) {
      emit(GetAllPostErrorState(message: error.toString()));
    }
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
