import 'package:bloc_clean/featers/post/data/model/post_model.dart';

import '../../../../core/network/api_client.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPost();

  Future<PostModel> createPost({required PostModel postModel});

  Future<PostModel> updatePost({required PostModel postModel});

  Future<bool> deletePost({required int id});
}

class PostRemoteDataSourceImp extends PostRemoteDataSource {
  @override
  Future<List<PostModel>> getAllPost() async {
    final response = await ApiClient.getDataList<PostModel>(
      endPoint: "posts",
      fromJsonT: (data) => PostModel.fromJson(data),
    );
    return response;
  }

  @override
  Future<PostModel> createPost({required PostModel postModel}) {
    final response = ApiClient.postData<PostModel>(
      body: postModel.toJson(),
      endpoint: "posts",
      fromJsonT: (data) => PostModel.fromJson(data),
    );
    return response;
  }

  @override
  Future<PostModel> updatePost({required PostModel postModel}) {
    final response = ApiClient.putData<PostModel>(
      body: postModel.toJson(),
      endpoint: "posts/${postModel.id}",
      fromJsonT: (data) => PostModel.fromJson(data),
    );
    return response;
  }

  @override
  Future<bool> deletePost({required int id}) {
    final response = ApiClient.deleteData(endpoint: "posts/$id");
    return response;
  }
}
