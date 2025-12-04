import 'package:union_shop/models/product.dart';

class Collection {
  final String id;
  final String title;
  final String description;
  final String image;
  final List<Product> products;

  Collection({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.products,
  });
}
