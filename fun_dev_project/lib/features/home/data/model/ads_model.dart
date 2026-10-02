import 'package:fun_dev_project/features/home/domain/entity/ads_entity.dart';

class AdsModel extends AdsEntity {
  AdsModel({required super.id, required super.title, required super.imageUrl});

  factory AdsModel.fromJson({required Map<String, dynamic> json}) {
    return AdsModel(
      id: json['Id'],
      title: json['Title'],
      imageUrl: json['ImageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'Id': id, 'Title': title, 'ImageUrl': imageUrl};
  }
}
