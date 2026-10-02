import '../../data/model/post_model.dart';
import '../repostry/post_repostry.dart';

class DeletePostUseCase {
  PostRepostry postRepostry;

  DeletePostUseCase({required this.postRepostry});

  Future<bool> call({required int id}) async {
    return await postRepostry.deletePost(id: id);
  }
}
