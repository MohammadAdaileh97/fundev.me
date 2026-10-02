import '../../data/model/post_model.dart';
import '../repostry/post_repostry.dart';

class UpdatePostUseCase {
  PostRepostry postRepostry;

  UpdatePostUseCase({required this.postRepostry});

  Future<PostModel> call({required PostModel postModel}) async {
    return await postRepostry.updatePost(postModel: postModel);
  }
}
