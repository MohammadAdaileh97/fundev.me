import 'package:api_clean/featers/posts/data/model/post_model.dart';
import 'package:api_clean/featers/posts/domain/repositries/post_repostiry.dart';

class GetPostUseCase {
  PostRepostiry postRepostiry;

  GetPostUseCase({required this.postRepostiry});

  Future<List<PostModel>> call() async {
    return await postRepostiry.getAllPosts();
  }
}
