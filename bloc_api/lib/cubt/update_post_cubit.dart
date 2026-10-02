import 'dart:convert';

import 'package:bloc_api/state/update_post_state.dart';
import 'package:bloc_api/utl/constant_values.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;

import '../model/post_model.dart';

class UpdatePostCubit extends Cubit<UpdatePostState> {
  UpdatePostCubit() : super(UpdatePostStateInitial());

  updatePost({
    required String title,
    required String body,
    required int userId,
    required int id,
  }) async {
    emit(UpdatePostStateLoading());
    try {
      final response = await http.put(
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        Uri.parse("${ConstantValues.baseUrl}posts/$id"),
        body: jsonEncode({
          'title': title,
          'body': body,
          'userId': userId,
          'id': id,
        }),
      );

      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body);
        emit(UpdatePostStateLoaded(post: PostModel.fromJson(jsonBody)));
      } else {
        emit(UpdatePostStateError(message: "Something went wrong"));
      }
    } catch (error) {
      emit(UpdatePostStateError(message: error.toString()));
    }
  }
}
