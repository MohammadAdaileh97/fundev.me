import '../../data/model/post_model.dart';
import '../repositries/post_repostiry.dart';

class CreatePostUseCase {
  PostRepostiry postRepostiry;

  CreatePostUseCase({required this.postRepostiry});

  Future<PostModel> call({
    required String title,
    required String body,
    required int userId,
  }) async {
    return await postRepostiry.createPost(
      title: title,
      body: body,
      userId: userId,
    );
  }
}
