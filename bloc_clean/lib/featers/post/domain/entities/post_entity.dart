class PostEntity {
  int? userId;
  int? id;
  String? title;
  String? body;
  bool? isLoading = false;

  PostEntity({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    required this.isLoading,
  });
}
