import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:union_shop/pages/collection_page.dart';
import 'package:union_shop/services/data_service.dart';
import 'package:union_shop/models/collection.dart';

void main() {
  testWidgets('Search filters products in CollectionPage',
      (WidgetTester tester) async {
    final Collection? collection = DataService.getCollection('tees');
    expect(collection, isNotNull);

    await tester.pumpWidget(MaterialApp(
      home: CollectionPage(collectionId: 'tees'),
    ));

    await tester.pumpAndSettle();

    // Verify original product appears
    expect(find.text('Union Tee'), findsOneWidget);

    // Enter search query that should hide it
    await tester.enterText(find.byType(TextField), 'hoodie');
    await tester.pumpAndSettle();

    // Union Tee should no longer be visible
    expect(find.text('Union Tee'), findsNothing);
  });
}
