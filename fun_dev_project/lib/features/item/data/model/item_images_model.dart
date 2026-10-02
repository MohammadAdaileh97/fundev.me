import 'package:fun_dev_project/features/item/domain/entity/item_images_entity.dart';

class ItemImagesModel extends ItemImagesEntity {
  ItemImagesModel({required super.id, required super.imageUrl});

  factory ItemImagesModel.fromJson({required Map<String, dynamic> json}) {
    return ItemImagesModel(id: json["Id"], imageUrl: json["ImageUrl"]);
  }

  Map<String, dynamic> toJson() => {"Id": id, "ImageUrl": imageUrl};
}
