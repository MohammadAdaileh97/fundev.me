import 'package:fun_dev_project/features/profile/domain/entity/response_entity.dart';

class ResponseModel extends ResponseEntity {
  ResponseModel({
    required super.result,
    required super.imageUrl,
    required super.msg,
  });

  factory ResponseModel.fromJson({required Map<String, dynamic> json}) {
    return ResponseModel(
      result: json['result'],
      imageUrl: json['imageUrl'],
      msg: json['msg'],
    );
  }
}
