import '../models/product.dart';
import 'package:flutter/foundation.dart';

class CartItem {
  final Product product;
  int qty;
  CartItem({required this.product, this.qty = 1});
}

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(Product product, {int qty = 1}) {
    final existing = _items.where((i) => i.product.id == product.id).toList();
    if (existing.isNotEmpty) {
      existing.first.qty += qty;
    } else {
      _items.add(CartItem(product: product, qty: qty));
    }
    notifyListeners();
  }

  void removeItem(Product product) {
    _items.removeWhere((i) => i.product.id == product.id);
    notifyListeners();
  }

  void updateQty(Product product, int qty) {
    final item = _items.firstWhere((i) => i.product.id == product.id);
    item.qty = qty;
    notifyListeners();
  }

  double subtotal() {
    return _items.fold(
        0, (sum, i) => sum + (i.product.salePrice ?? i.product.price) * i.qty);
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
