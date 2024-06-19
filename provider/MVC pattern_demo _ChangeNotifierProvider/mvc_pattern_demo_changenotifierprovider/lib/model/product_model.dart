
class ProductModel{

  String? productImage;
  String? productName;
  String? price;
  bool? isFavorite;
  int? quantity;

  ProductModel({
    this.productName,
    this.isFavorite,
    this.price,
    this.productImage,
    this.quantity
  });
}