import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:union_shop/main.dart';
import 'package:union_shop/services/cart_service.dart';

void main() {
  testWidgets('App loads HomePage and shows hero text',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => CartService(),
        child: const UnionShopApp(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Welcome to union shop'), findsOneWidget);
  });
}
