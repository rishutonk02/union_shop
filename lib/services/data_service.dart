import '../models/product.dart';
import '../models/collection.dart';

class DataService {
  static final List<Product> _products = [
    Product(
      id: 'p1',
      title: 'Hoodie',
      description: 'soft and warm hoodie',
      price: 15.00,
      salePrice: 7.99,
      images: [
        'assets/images/hoodie.jpg',
        'assets/images/hoodieu.jpg',
        'assets/images/hoodie1.avif',
      ],
      sizes: ['S', 'M', 'L', 'XL'],
      colors: ['Black', 'Green'],
      collectionId: 'hoodies',
    ),
    Product(
      id: 'p2',
      title: 'Union Tee',
      description: 'Cool t-shirt',
      price: 10.50,
      images: ['assets/images/tshirt.jpeg', 'assets/images/tshirt2.jpg'],
      sizes: ['S', 'M', 'L', 'XL'],
      colors: ['White', 'Blue'],
      collectionId: 'tees',
    ),
    Product(
      id: 'p3',
      title: 'Uni Mug',
      description: 'good mug for coffee and tea',
      price: 7.00,
      salePrice: 5.99,
      images: ['assets/images/mug.jpg'],
      sizes: const [],
      colors: ['Black', 'White'],
      collectionId: 'mugs',
    ),
    Product(
      id: 'p4',
      title: 'University Tote Bag',
      description: 'good quality tote bag',
      price: 6.25,
      images: ['assets/images/tote-bag.jpg'],
      sizes: const [],
      colors: ['Natural', 'Black'],
      collectionId: 'totes',
    ),
    Product(
      id: 'p5',
      title: 'notepad',
      description: 'best notepad for notes',
      price: 5.25,
      salePrice: 3.99,
      images: ['assets/images/notepad.webp'],
      sizes: const [],
      colors: ['Natural', 'Black'],
      collectionId: 'notepads',
    ),
  ];

  static final List<Collection> _collections = [
    Collection(
      id: 'hoodies',
      title: 'Hoodies',
      description: 'cozzy and warm hoodie',
      image: 'assets/images/hoodieu.jpg',
      products: _products.where((p) => p.collectionId == 'hoodies').toList(),
    ),
    Collection(
      id: 'tees',
      title: 'T-Shirts',
      description: 'nice t-shirts for everyday wear',
      image: 'assets/images/tshirt.jpeg',
      products: _products.where((p) => p.collectionId == 'tees').toList(),
    ),
    Collection(
      id: 'mugs',
      title: 'Uni Mugs',
      description: 'enjoy the feeling of coffee',
      image: 'assets/images/mug.jpg',
      products: _products.where((p) => p.collectionId == 'mugs').toList(),
    ),
    Collection(
      id: 'totes',
      title: 'University Tote Bags',
      description: 'enjoy your tote bags and be stylish',
      image: 'assets/images/tote-bag.jpg',
      products: _products.where((p) => p.collectionId == 'totes').toList(),
    ),
    Collection(
      id: 'notepads',
      title: 'Notepads',
      description: 'write your notes here',
      image: 'assets/images/notepad.webp',
      products: _products.where((p) => p.collectionId == 'notepads').toList(),
    ),
  ];

  static List<Collection> getCollections() => _collections;

  static Collection? getCollection(String id) {
    try {
      return _collections.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }

  static Product? getProduct(String id) {
    try {
      return _products.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  static List<Product> search(String query) {
    final q = query.toLowerCase();
    return _products
        .where((p) =>
            p.title.toLowerCase().contains(q) ||
            p.description.toLowerCase().contains(q))
        .toList();
  }
}
