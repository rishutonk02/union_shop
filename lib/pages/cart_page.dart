import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';
import '../services/cart_service.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartService>();

    return Scaffold(
      appBar: const Navbar(),
      body: cart.items.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : ListView(
              children: [
                ...cart.items.map((item) {
                  final src = item.product.images.first;
                  return ListTile(
                    leading: src.startsWith('http')
                        ? Image.network(src,
                            width: 64, height: 64, fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              width: 64,
                              height: 64,
                              child: const Center(
                                child: Icon(Icons.image_not_supported,
                                    color: Colors.grey),
                              ),
                            );
                          })
                        : Image.asset(src,
                            width: 64, height: 64, fit: BoxFit.cover),
                    title: Text(item.product.title),
                    subtitle: Text(
                        '£${(item.product.salePrice ?? item.product.price).toStringAsFixed(2)}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: item.qty > 1
                              ? () => cart.updateQty(item.product, item.qty - 1)
                              : () => cart.removeItem(item.product),
                        ),
                        Text('${item.qty}'),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () =>
                              cart.updateQty(item.product, item.qty + 1),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Subtotal: £${cart.subtotal().toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: FilledButton(
                    onPressed: () {
                      cart.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Order placed')));
                    },
                    child: const Text('Checkout'),
                  ),
                ),
                const Footer(),
              ],
            ),
    );
  }
}
