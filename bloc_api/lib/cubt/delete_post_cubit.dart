import 'package:bloc_api/utl/constant_values.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;

import '../state/delete_post_state.dart';

class DeletePostCubit extends Cubit<DeletePostState> {
  DeletePostCubit() : super(DeletePostStateInitial());

  deletePost({required int id}) async {
    emit(DeletePostStateLoading());
    try {
      final response = await http.delete(
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        Uri.parse("${ConstantValues.baseUrl}posts/$id"),
      );

      if (response.statusCode == 200) {
        emit(DeletePostStateLoaded());
      } else {
        emit(DeletePostStateError(message: "Something went wrong"));
      }
    } catch (error) {
      emit(DeletePostStateError(message: error.toString()));
    }
  }
}
