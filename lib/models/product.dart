class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final double? salePrice;
  final List<String> images;
  final List<String> sizes;
  final List<String> colors;
  final String collectionId;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.salePrice,
    required this.images,
    required this.sizes,
    required this.colors,
    required this.collectionId,
  });
}
