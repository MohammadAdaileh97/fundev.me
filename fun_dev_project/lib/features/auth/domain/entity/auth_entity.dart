class AuthEntity {
  bool? result;
  String? id;
  String? email;
  String? name;
  String? msg;
  int? otp;
  String? imageUrl;

  AuthEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.result,
    required this.msg,
    required this.otp,
    required this.imageUrl,

  });
}
