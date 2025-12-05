import 'package:flutter/foundation.dart';
import '../models/product.dart';
import 'data_service.dart';

class CartItem {
  final Product product;
  int qty;
  CartItem({required this.product, this.qty = 1});
}

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];
  String? userId;

  // in-memory fallback to simulate persistence during tests
  static final Map<String, List<Map<String, dynamic>>> _inMemory = {};

  List<CartItem> get items => List.unmodifiable(_items);

  void setUser(String? uid) {
    userId = uid;
    if (uid == null) {
      _items.clear();
      notifyListeners();
    } else {
      loadCart();
    }
  }

  Future<void> loadCart() async {
    if (userId == null) return;
    final stored = _inMemory[userId];
    if (stored != null) {
      _items.clear();
      for (var i in stored) {
        final p = DataService.getProduct(i['productId']);
        if (p != null) _items.add(CartItem(product: p, qty: i['qty'] as int));
      }
      notifyListeners();
    }
  }

  Future<void> saveCart() async {
    if (userId == null) return;
    _inMemory[userId!] =
        _items.map((i) => {'productId': i.product.id, 'qty': i.qty}).toList();
  }

  void addItem(Product product, {int qty = 1}) {
    final existing = _items.where((i) => i.product.id == product.id).toList();
    if (existing.isNotEmpty) {
      existing.first.qty += qty;
    } else {
      _items.add(CartItem(product: product, qty: qty));
    }
    saveCart();
    notifyListeners();
  }

  void removeItem(Product product) {
    _items.removeWhere((i) => i.product.id == product.id);
    saveCart();
    notifyListeners();
  }

  void updateQty(Product product, int qty) {
    final existing = _items.where((i) => i.product.id == product.id).toList();
    if (existing.isNotEmpty) {
      existing.first.qty = qty;
      if (existing.first.qty <= 0)
        _items.removeWhere((i) => i.product.id == product.id);
      saveCart();
      notifyListeners();
    }
  }

  double subtotal() {
    double total = 0.0;
    for (var i in _items) {
      final price = i.product.salePrice ?? i.product.price;
      total += price * i.qty;
    }
    return total;
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
