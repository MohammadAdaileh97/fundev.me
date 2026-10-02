import 'package:bloc_clean/featers/post/data/data_source/post_remote_data_source.dart';
import 'package:bloc_clean/featers/post/data/model/post_model.dart';
import 'package:bloc_clean/featers/post/domain/repostry/post_repostry.dart';

class PostRepostoryImp extends PostRepostry {
  PostRemoteDataSource postRemoteDataSource;

  PostRepostoryImp({required this.postRemoteDataSource});

  @override
  Future<List<PostModel>> getAllPost() async {
    return await postRemoteDataSource.getAllPost();
  }

  @override
  Future<PostModel> createPost({required PostModel postModel}) async {
    return await postRemoteDataSource.createPost(postModel: postModel);
  }

  @override
  Future<bool> deletePost({required int id}) async {
    return await postRemoteDataSource.deletePost(id: id);
  }

  @override
  Future<PostModel> updatePost({required PostModel postModel}) async {
    return await postRemoteDataSource.updatePost(postModel: postModel);
  }
}
