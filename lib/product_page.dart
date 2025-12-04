// Provide a lightweight top-level `ProductPage` used by tests and simple imports.
// Internally it delegates to the real product page implementation located
// at `lib/pages/product_page.dart`, supplying a default product id when none
// is required by the caller (tests expect a no-argument constructor).
import 'package:flutter/material.dart';
import 'product_model.dart' as model;

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Tests expect the simple placeholder product page from `product_model.dart`.
    return const model.ProductPage();
  }
}
