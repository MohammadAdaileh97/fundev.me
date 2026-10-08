class DataModel {
  String? iDNation;
  String? nation;
  int? iDYear;
  String? year;
  int? population;
  String? slugNation;

  DataModel({
    this.iDNation,
    this.nation,
    this.iDYear,
    this.year,
    this.population,
    this.slugNation,
  });

  DataModel.fromJson({required Map<String, dynamic> json}) {
    iDNation = json['ID Nation'];
    nation = json['Nation'];
    iDYear = json['ID Year'];
    year = json['Year'];
    population = json['Population'];
    slugNation = json['Slug Nation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID Nation'] = iDNation;
    data['Nation'] = nation;
    data['ID Year'] = iDYear;
    data['Year'] = year;
    data['Population'] = population;
    data['Slug Nation'] = slugNation;
    return data;
  }
}
