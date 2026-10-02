import '../../data/model/post_model.dart';

abstract class PostRepostry {
  Future<List<PostModel>> getAllPost();

  Future<PostModel> createPost({required PostModel postModel});

  Future<PostModel> updatePost({required PostModel postModel});

  Future<bool> deletePost({required int id});
}
