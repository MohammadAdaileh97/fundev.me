import 'package:api_clean/featers/posts/data/data_source/posts_data_source.dart';
import 'package:api_clean/featers/posts/data/model/post_model.dart';
import 'package:api_clean/featers/posts/domain/repositries/post_repostiry.dart';

class PostRepostoryImp extends PostRepostiry {
  PostsDataSource remoteDataSource;

  PostRepostoryImp({required this.remoteDataSource});

  @override
  Future<List<PostModel>> getAllPosts() async {
    return await remoteDataSource.getAllPosts();
  }

  @override
  Future<PostModel> createPost({
    required String title,
    required String body,
    required int userId,
  }) async {
    return await remoteDataSource.createPost(
      title: title,
      body: body,
      userId: userId,
    );
  }
}
