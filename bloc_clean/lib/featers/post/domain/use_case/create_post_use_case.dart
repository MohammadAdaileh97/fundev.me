import '../../data/model/post_model.dart';
import '../repostry/post_repostry.dart';

class CreatePostUseCase {
  PostRepostry postRepostry;

  CreatePostUseCase({required this.postRepostry});

  Future<PostModel> call({required PostModel postModel}) async {
    return await postRepostry.createPost(postModel: postModel);
  }
}
