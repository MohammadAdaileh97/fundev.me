import 'annotations.dart';

class SourceModel {
  List<String>? measures;
  Annotations? annotations;
  String? name;

  SourceModel({this.measures, this.annotations, this.name});

  SourceModel.fromJson({required Map<String, dynamic> json}) {
    measures = json['measures'].cast<String>();
    annotations =
        json['annotations'] != null
            ? Annotations.fromJson(json: json['annotations'])
            : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['measures'] = measures;
    if (annotations != null) {
      data['annotations'] = annotations!.toJson();
    }
    data['name'] = name;
    return data;
  }
}
