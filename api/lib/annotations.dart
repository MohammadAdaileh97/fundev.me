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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source_name'] = this.sourceName;
    data['source_description'] = this.sourceDescription;
    data['dataset_name'] = this.datasetName;
    data['dataset_link'] = this.datasetLink;
    data['table_id'] = this.tableId;
    data['topic'] = this.topic;
    data['subtopic'] = this.subtopic;
    return data;
  }
}
