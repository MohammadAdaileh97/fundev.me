import 'package:bloc_clean/featers/post/domain/use_case/delete_post_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/delete_post_state.dart';

class DeletePostCubit extends Cubit<DeletePostState> {
  DeletePostUseCase deletePostUseCase;

  DeletePostCubit({required this.deletePostUseCase})
    : super(DeletePostStateInitial());

  deletePost({required int id}) async {
    emit(DeletePostStateLoading());
    await deletePostUseCase
        .call(id: id)
        .then(
          (value) {
            if (value) {
              emit(DeletePostStateLoaded());
            } else {
              emit(DeletePostStateError(message: 'error'));
            }
          },
          onError: (error) {
            emit(DeletePostStateError(message: error.toString()));
          },
        );
  }
}
