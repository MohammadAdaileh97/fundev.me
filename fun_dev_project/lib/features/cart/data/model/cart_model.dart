import 'package:fun_dev_project/features/cart/domain/entity/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({required super.result, required super.msg});

  factory CartModel.fromJson({required Map<String, dynamic> json}) {
    return CartModel(result: json['result'], msg: json['msg']);
  }

  Map<String, dynamic> toJson() {
    return {'result': result, 'msg': msg};
  }
}
