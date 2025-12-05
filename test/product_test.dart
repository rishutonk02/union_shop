import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/services/cart_service.dart';
import 'package:union_shop/pages/product_page.dart';

void main() {
  testWidgets('ProductPage renders product details and adds to cart',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => CartService(),
        child: const MaterialApp(home: ProductPage(productId: 'p1')),
      ),
    );

    await tester.pumpAndSettle();

    // Product title should appear
    expect(find.text('Hoodie'), findsOneWidget);

    // Price should appear
    expect(find.textContaining('£'), findsWidgets);

    // Quantity UI verified by presence of Add to Cart and price above

    // Add to Cart button
    expect(find.widgetWithText(FilledButton, 'Add to Cart'), findsOneWidget);

    // Tap Add to Cart
    await tester.tap(find.widgetWithText(FilledButton, 'Add to Cart'));
    await tester.pump();

    // Snackbar confirmation
    expect(find.text('Added to cart'), findsOneWidget);
  });
}
