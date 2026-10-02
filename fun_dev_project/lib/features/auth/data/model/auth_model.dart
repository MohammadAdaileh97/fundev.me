import 'package:fun_dev_project/features/auth/domain/entity/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel({
    required super.email,
    required super.id,
    required super.name,
    required super.msg,
    required super.result,
    required super.otp,
    required super.imageUrl,
  });

  factory AuthModel.fromJson({required Map<String, dynamic> json}) {
    return AuthModel(
      email: json['Email'],
      id: json['Id'],
      name: json['Name'],
      msg: json['msg'],
      result: json['result'],
      otp: json['otp'],
      imageUrl: json['ImageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Email': email,
      'Id': id,
      'Name': name,
      'msg': msg,
      'result': result,
      'otp': otp,
      'ImageUrl': imageUrl,
    };
  }
}
