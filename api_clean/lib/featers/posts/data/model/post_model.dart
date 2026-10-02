import 'package:api_clean/featers/posts/domain/entity/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    required super.userId,
    required super.title,
    required super.body,
    required super.id,
  });

  factory PostModel.fromJson({required Map<String, dynamic> json}) {
    return PostModel(
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'title': title, 'body': body, 'id': id};
  }
}
