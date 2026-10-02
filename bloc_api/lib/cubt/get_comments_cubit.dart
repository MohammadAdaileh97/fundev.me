import 'dart:convert';

import 'package:bloc_api/network/api_client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/comments_model.dart';
import '../state/get_comments_state.dart';

class GetCommentsCubit extends Cubit<GetCommentsState> {
  GetCommentsCubit() : super(GetCommentsStateInitial());

  getCommentsByPost({required int postId}) async {
    emit(GetCommentsStateLoading());

    await ApiClient.getDataList(
      endPoint: "posts/$postId/comments",
      fromJsonT: (data) => CommentsModel.fromJson(data),
    ).then(
      (comments) {
        emit(GetCommentsStateLoaded(comments: comments));
      },
      onError: (error) {
        emit(GetCommentsStateError(message: error.toString()));
      },
    );
  }
}
