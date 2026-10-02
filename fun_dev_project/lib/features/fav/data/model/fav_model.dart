import 'package:fun_dev_project/features/fav/domain/entity/fav_entity.dart';

class FavModel extends FavEntity {
  FavModel({required super.result, required super.msg});

  factory FavModel.fromJson({required Map<String, dynamic> json}) {
    return FavModel(result: json['result'], msg: json['msg']);
  }

  Map<String, dynamic> toJson() {
    return {'result': result, 'msg': msg};
  }
}
