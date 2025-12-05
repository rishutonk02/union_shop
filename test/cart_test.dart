import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/services/data_service.dart';
import 'package:union_shop/models/product.dart';

void main() {
  late CartService cart;
  late Product hoodie;

  setUp(() {
    cart = CartService();
    hoodie = DataService.getProduct('p1')!;
  });

  test('Add item to cart increases items length', () {
    expect(cart.items.length, 0);
    cart.addItem(hoodie);
    expect(cart.items.length, 1);
    expect(cart.items.first.product.title, 'Hoodie');
  });

  test('Update quantity changes subtotal correctly', () {
    cart.addItem(hoodie, qty: 2);
    final subtotal = cart.subtotal();
    expect(subtotal, (hoodie.salePrice ?? hoodie.price) * 2);
    cart.updateQty(hoodie, 3);
    expect(cart.items.first.qty, 3);
    expect(cart.subtotal(), (hoodie.salePrice ?? hoodie.price) * 3);
  });

  test('Remove item empties cart', () {
    cart.addItem(hoodie);
    expect(cart.items.isNotEmpty, true);
    cart.removeItem(hoodie);
    expect(cart.items.isEmpty, true);
  });

  test('Clear cart empties all items', () {
    cart.addItem(hoodie);
    cart.addItem(hoodie);
    expect(cart.items.isNotEmpty, true);
    cart.clear();
    expect(cart.items.isEmpty, true);
  });
}
