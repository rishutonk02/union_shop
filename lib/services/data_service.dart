import '../models/product.dart';
import '../models/collection.dart';

class DataService {
  static final _products = [
    Product(
      id: 'p1',
      title: 'Union Hoodie',
      description: 'Warm hoodie with logo',
      price: 39.99,
      salePrice: 29.99,
      images: ['https://picsum.photos/seed/p1/600/400'],
      sizes: ['S', 'M', 'L'],
      colors: ['Black', 'Blue'],
      collectionId: 'hoodies',
    ),
    Product(
      id: 'p2',
      title: 'Union Tee',
      description: 'Classic t-shirt',
      price: 19.99,
      images: ['https://picsum.photos/seed/p2/600/400'],
      sizes: ['S', 'M', 'L'],
      colors: ['White', 'Red'],
      collectionId: 'tees',
    ),
  ];

  static final _collections = [
    Collection(
      id: 'hoodies',
      title: 'Hoodies',
      description: 'Warm hoodies',
      image: 'https://picsum.photos/seed/hoodies/600/400',
      products: _products.where((p) => p.collectionId == 'hoodies').toList(),
    ),
    Collection(
      id: 'tees',
      title: 'T-Shirts',
      description: 'Casual tees',
      image: 'https://picsum.photos/seed/tees/600/400',
      products: _products.where((p) => p.collectionId == 'tees').toList(),
    ),
  ];

  static List<Collection> getCollections() => _collections;
  static Collection? getCollection(String id) => _collections
      .firstWhere((c) => c.id == id, orElse: () => _collections.first);
  static Product? getProduct(String id) =>
      _products.firstWhere((p) => p.id == id, orElse: () => _products.first);
}
