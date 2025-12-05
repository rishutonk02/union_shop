import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';
import '../widgets/product_card.dart';
import '../services/data_service.dart';
import '../models/collection.dart';

class CollectionPage extends StatefulWidget {
  final String collectionId;
  const CollectionPage({super.key, required this.collectionId});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  late Collection? collection;
  late List productsToShow;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    collection = DataService.getCollection(widget.collectionId);
    productsToShow = collection?.products.toList() ?? [];
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final q = _searchController.text.toLowerCase();
    setState(() {
      if (q.isEmpty) {
        productsToShow = collection?.products.toList() ?? [];
      } else {
        productsToShow = (collection?.products ?? [])
            .where((p) =>
                p.title.toLowerCase().contains(q) ||
                p.description.toLowerCase().contains(q))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (collection == null) {
      return const Scaffold(body: Center(child: Text('Collection not found')));
    }

    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width < 600 ? 2 : 4;

    return Scaffold(
      appBar: const Navbar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(collection!.title,
                style: Theme.of(context).textTheme.headlineSmall),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration:
                        const InputDecoration(hintText: 'Search products'),
                  ),
                ),
                const SizedBox(width: 12),
                DropdownButton<String>(
                  value: 'All',
                  items: const [
                    DropdownMenuItem(value: 'All', child: Text('All')),
                    DropdownMenuItem(
                        value: 'PriceLow', child: Text('Price: Low to High')),
                    DropdownMenuItem(
                        value: 'PriceHigh', child: Text('Price: High to Low')),
                  ],
                  onChanged: (_) {},
                ),
                const Spacer(),
                DropdownButton<String>(
                  value: 'Page1',
                  items: const [
                    DropdownMenuItem(value: 'Page1', child: Text('Page 1')),
                    DropdownMenuItem(value: 'Page2', child: Text('Page 2')),
                  ],
                  onChanged: (_) {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.7,
              children: productsToShow.map((p) {
                return ProductCard(
                  id: p.id,
                  title: p.title,
                  price: p.salePrice ?? p.price,
                  imageUrl: p.images.first,
                );
              }).toList(),
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}
