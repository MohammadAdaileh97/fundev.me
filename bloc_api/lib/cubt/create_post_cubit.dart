import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/post_model.dart';
import '../state/create_post_state.dart';
import 'package:http/http.dart' as http;

import '../utl/constant_values.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostStateInitial());

  createPost({
    required String title,
    required String body,
    required int userId,
  }) async {
    emit(CreatePostStateLoading());
    try {
      final response = await http.post(
        Uri.parse('${ConstantValues.baseUrl}posts'),
        body: jsonEncode({'title': title, 'body': body, 'userId': userId}),
        headers: {'Content-type': 'application/json; charset=UTF-8'},
      );
      if (response.statusCode == 201) {
        emit(
          CreatePostStateLoaded(
            post: PostModel.fromJson(jsonDecode(response.body)),
          ),
        );
      } else {
        emit(CreatePostStateError(message: "Something went wrong"));
      }
    } catch (error) {
      emit(CreatePostStateError(message: error.toString()));
    }
  }
}
