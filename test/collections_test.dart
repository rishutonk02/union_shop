import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/models/collection.dart';
import 'package:union_shop/pages/collections_page.dart';
import 'package:union_shop/services/data_service.dart';
// Removed duplicate imports

void main() {
  testWidgets('CollectionsPage shows all collections from DataService',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: CollectionsPage()));
    await tester.pumpAndSettle();

    // Get collections from DataService
    final List<Collection> collections = DataService.getCollections();

    // Verify each collection title is rendered
    for (final c in collections) {
      expect(find.text(c.title), findsOneWidget);
    }

    // Verify grid cards are present
    expect(find.byType(Card), findsWidgets);
  });

  testWidgets('Tapping a collection card navigates to CollectionPage',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      onGenerateRoute: (settings) {
        if (settings.name == '/collections/hoodies') {
          return MaterialPageRoute(
              builder: (_) => const Scaffold(body: Text('Hoodies Page')));
        }
        return MaterialPageRoute(builder: (_) => const CollectionsPage());
      },
      initialRoute: '/',
    ));

    await tester.pumpAndSettle();

    // Tap the Hoodies card
    await tester.tap(find.text('Hoodies'));
    await tester.pumpAndSettle();

    // Verify navigation
    expect(find.text('Hoodies Page'), findsOneWidget);
  });
}
