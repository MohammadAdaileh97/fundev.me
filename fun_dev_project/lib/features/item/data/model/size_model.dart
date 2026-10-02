import '../../domain/entity/size_entity.dart';

class SizeModel extends SizeEntity {
  SizeModel({required super.id, required super.name});

  factory SizeModel.fromJson({required Map<String, dynamic> json}) {
    return SizeModel(id: json["Id"], name: json["Name"]);
  }

  Map<String, dynamic> toJson() {
    return {"Id": id, "Name": name};
  }
}
