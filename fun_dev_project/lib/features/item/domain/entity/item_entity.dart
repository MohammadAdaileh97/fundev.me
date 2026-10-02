class ItemEntity {
  String? id;
  String? name;
  String? categoryName;
  String? imageUrl;
  String? rate;
  double? price;
  String? numberRates;
  String? description;
  bool? isFavorite;

  ItemEntity({
    this.id,
    this.name,
    this.categoryName,
    this.imageUrl,
    this.rate,
    this.price,
    this.numberRates,
    this.description,
    this.isFavorite,
  });
}
