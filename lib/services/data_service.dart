import '../models/product.dart';
import '../models/collection.dart';

class DataService {
  static final List<Product> _products = [
    Product(
      id: 'p1',
      title: 'Hoodie',
      description: 'Warm hoodie with logo',
      price: 15.00,
      salePrice: 8.99,
      images: ['assets/images/hoodie.jpg', 'assets/images/hoodieu.jpg'],
      sizes: ['S', 'M', 'L'],
      colors: ['Black', 'Green'],
      collectionId: 'hoodies',
    ),
    Product(
      id: 'p2',
      title: 'Union T-Shirt',
      description: 'Classic T-Shirt',
      price: 9.50,
      images: [
        'assets/images/tshirt.jpeg',
        'https://picsum.photos/seed/tshirt_alt/600/400'
      ],
      sizes: ['S', 'M', 'L', 'XL'],
      colors: ['White', 'Red'],
      collectionId: 'T-Shirts',
    ),
    Product(
      id: 'p3',
      title: 'Universiry Mug',
      description: 'good mug for coffee',
      price: 6.00,
      images: ['assets/images/mug.jpg'],
      sizes: const [],
      colors: ['Black', 'White'],
      collectionId: 'mugs',
    ),
    Product(
      id: 'p4',
      title: 'University Tote Bag',
      description: 'Good quality cotton tote bags, long lasting',
      price: 5.25,
      salePrice: 3.99,
      images: ['assets/images/tote-bag.jpg'],
      sizes: const [],
      colors: ['Natural', 'Black'],
      collectionId: 'totes',
    ),
    Product(
      id: 'p5',
      title: 'Notepad',
      description: 'good quality notepad for notes',
      price: 5.00,
      salePrice: 2.99,
      images: ['assets/images/notepad.webp'],
      sizes: const [],
      colors: ['Black', 'white'],
      collectionId: 'notepads',
    ),
  ];

  static final List<Collection> _collections = [
    Collection(
      id: 'hoodies',
      title: 'Hoodies',
      description: 'Comfertable hoodies for uni life',
      image: 'assets/images/hoodieu.jpg',
      products: _products.where((p) => p.collectionId == 'hoodies').toList(),
    ),
    Collection(
      id: 'T-Shirts',
      title: 'T-Shirts',
      description: 'Cotton T-Shirt with nice colour',
      image: 'assets/images/tshirt2.jpg',
      products: _products.where((p) => p.collectionId == 'T-Shirts').toList(),
    ),
    Collection(
      id: 'mugs',
      title: 'Mugs',
      description: 'Good mug for coffee and tea',
      image: 'assets/images/mug.jpg',
      products: _products.where((p) => p.collectionId == 'mugs').toList(),
    ),
    Collection(
      id: 'totes',
      title: 'Tote Bags',
      description:
          'Carry books and anything that you like to handy and comfort',
      image: 'assets/images/tote-bag.jpg',
      products: _products.where((p) => p.collectionId == 'totes').toList(),
    ),
    Collection(
      id: 'notpads',
      title: 'Notepas',
      description: 'keep your notes safe and secure with this notepad',
      image: 'assets/images/notepad.webp',
      products: _products.where((p) => p.collectionId == 'notpads').toList(),
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
