class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;
  bool isLoading = false;

  PostModel({
    this.userId,
    this.id,
    this.title,
    this.body,
    this.isLoading = false,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    isLoading = false;
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
