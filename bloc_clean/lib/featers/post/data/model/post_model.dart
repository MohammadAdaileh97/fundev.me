import 'package:bloc_clean/featers/post/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    required super.userId,
    super.id,
    required super.title,
    required super.body,
    super.isLoading,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
      isLoading: false,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
