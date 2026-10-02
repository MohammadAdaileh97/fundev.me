import '../../domain/entity/color_entity.dart';

class ColorModel extends ColorEntity {
  ColorModel({required super.id, required super.name, required super.code});

  factory ColorModel.fromJson({required Map<String, dynamic> json}) {
    return ColorModel(id: json["Id"], name: json["Name"], code: json["Code"]);
  }

  Map<String, dynamic> toJson() {
    return {"Id": id, "Name": name, "Code": code};
  }
}
