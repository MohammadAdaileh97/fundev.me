import '../../data/model/post_model.dart';

abstract class PostRepostiry {
  Future<List<PostModel>> getAllPosts();

  Future<PostModel> createPost({
    required String title,
    required String body,
    required int userId,
  });
}
