class Annotations {
  String? sourceName;
  String? sourceDescription;
  String? datasetName;
  String? datasetLink;
  String? tableId;
  String? topic;
  String? subtopic;

  Annotations({
    this.sourceName,
    this.sourceDescription,
    this.datasetName,
    this.datasetLink,
    this.tableId,
    this.topic,
    this.subtopic,
  });

  Annotations.fromJson({required Map<String, dynamic> json}) {
    sourceName = json['source_name'];
    sourceDescription = json['source_description'];
    datasetName = json['dataset_name'];
    datasetLink = json['dataset_link'];
    tableId = json['table_id'];
    topic = json['topic'];
    subtopic = json['subtopic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['source_name'] = sourceName;
    data['source_description'] = sourceDescription;
    data['dataset_name'] = datasetName;
    data['dataset_link'] = datasetLink;
    data['table_id'] = tableId;
    data['topic'] = topic;
    data['subtopic'] = subtopic;
    return data;
  }
}
