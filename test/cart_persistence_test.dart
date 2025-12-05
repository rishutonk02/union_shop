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

  test('Cart saves and loads items', () async {
    cart.setUser('testUser');
    cart.addItem(hoodie, qty: 2);

    // Simulate save
    await cart.saveCart();

    // Clear and reload
    cart.clear();
    await cart.loadCart();

    // Verify hoodie restored
    expect(cart.items.isNotEmpty, true);
    expect(cart.items.first.product.id, 'p1');
    expect(cart.items.first.qty, 2);
  });

  test('Cart clears on logout', () {
    cart.addItem(hoodie);
    expect(cart.items.isNotEmpty, true);

    cart.setUser(null); // simulate logout
    expect(cart.items.isEmpty, true);
  });
}
