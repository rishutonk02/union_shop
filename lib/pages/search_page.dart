import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';
import '../services/data_service.dart';
import '../widgets/product_card.dart';

class SearchPage extends StatelessWidget {
  final String query;
  const SearchPage({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    final results = DataService.search(query);
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width < 600 ? 2 : 4;

    return Scaffold(
      appBar: const Navbar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Search results for "$query"',
                style: Theme.of(context).textTheme.headlineSmall),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: results.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (_, i) {
                final p = results[i];
                return ProductCard(
                  id: p.id,
                  title: p.title,
                  price: p.salePrice ?? p.price,
                  imageUrl: p.images.first,
                );
              },
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}
