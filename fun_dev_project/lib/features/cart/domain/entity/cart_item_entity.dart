class CartItemEntity {
  String? cartId;
  String? itemId;
  String? itemName;
  String? itemImageUrl;
  double? itemPrice;
  String? quantity;
  String? size;
  String? color;

  CartItemEntity({
    required this.itemPrice,
    required this.quantity,
    required this.size,
    required this.color,
    required this.cartId,
    required this.itemId,
    required this.itemName,
    required this.itemImageUrl,
  });
}
