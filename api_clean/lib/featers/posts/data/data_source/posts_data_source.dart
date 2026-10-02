import 'package:api_clean/core/network/api_client.dart';
import 'package:api_clean/featers/posts/data/model/post_model.dart';

abstract class PostsDataSource {
  Future<List<PostModel>> getAllPosts();

  Future<PostModel> createPost({
    required String title,
    required String body,
    required int userId,
  });
}

class PostsRemoteDataSource extends PostsDataSource {
  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await ApiClient.getDataList(
      endpoint: "posts",
      fromJsonT: (data) => PostModel.fromJson(json: data),
    );
    return response;
  }

  @override
  Future<PostModel> createPost({
    required String title,
    required String body,
    required int userId,
  }) async {
    final response = await ApiClient.postData(
      endpoint: "posts",
      body: {"title": title, 'body': body, 'userId': userId},
      fromJsonT: (data) => PostModel.fromJson(json: data),
    );
    return response;
  }
}
