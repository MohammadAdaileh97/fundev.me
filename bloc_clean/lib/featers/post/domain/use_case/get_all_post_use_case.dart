import 'package:bloc_clean/featers/post/domain/repostry/post_repostry.dart';

import '../../data/model/post_model.dart';

class GetAllPostUseCase {
  PostRepostry postRepostry;

  GetAllPostUseCase({required this.postRepostry});

  Future<List<PostModel>> call() async {
    return await postRepostry.getAllPost();
  }
}
