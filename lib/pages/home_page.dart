import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: ListView(
        children: const [
          _HeroBanner(),
          _FeaturedCollections(),
          _ProductSection(),
          SizedBox(height: 24),
          _PromoSale(),
          SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Placeholder Footer'),
          ),
          Footer(),
        ],
      ),
    );
  }
}

class _HeroBanner extends StatelessWidget {
  const _HeroBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      color: Theme.of(context).colorScheme.primaryContainer,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Placeholder Hero Title',
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          const Text('Placeholder Footer'),
          const Text('Students should customise this footer section'),
        ],
      ),
    );
  }
}

class _ProductSection extends StatelessWidget {
  const _ProductSection();

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'id': 'p1',
        'title': 'Placeholder Product 1',
        'price': 10.0,
        'image': 'https://picsum.photos/seed/p1/600/400'
      },
      {
        'id': 'p2',
        'title': 'Placeholder Product 2',
        'price': 15.0,
        'image': 'https://picsum.photos/seed/p2/600/400'
      },
      {
        'id': 'p3',
        'title': 'Placeholder Product 3',
        'price': 20.0,
        'image': 'https://picsum.photos/seed/p3/600/400'
      },
      {
        'id': 'p4',
        'title': 'Placeholder Product 4',
        'price': 25.0,
        'image': 'https://picsum.photos/seed/p4/600/400'
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('PLACEHOLDER PRODUCTS SECTION',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('BROWSE PRODUCTS'),
              Text('VIEW ALL PRODUCTS'),
            ],
          ),
          const SizedBox(height: 12),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            children: products.map((p) {
              return InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, '/product/${p['id']}'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.network(p['image']!.toString(),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(color: Colors.grey[300])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(p['title']!.toString(),
                          maxLines: 1, overflow: TextOverflow.ellipsis),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4),
                      child: Text(
                          '£${(p['price'] as double).toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _FeaturedCollections extends StatelessWidget {
  const _FeaturedCollections();
  final collections = const [
    {
      'id': 'hoodies',
      'title': 'Hoodies',
      'image': 'https://picsum.photos/seed/hoodies/600/400'
    },
    {
      'id': 'tees',
      'title': 'T-Shirts',
      'image': 'https://picsum.photos/seed/tees/600/400'
    },
    {
      'id': 'accessories',
      'title': 'Accessories',
      'image': 'https://picsum.photos/seed/accessories/600/400'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width < 600 ? 2 : 3;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: collections.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1,
        ),
        itemBuilder: (_, i) {
          final c = collections[i];
          return InkWell(
            onTap: () => Navigator.pushNamed(_, '/collections/${c['id']}'),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(c['image']!, fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                  );
                }),
                Container(color: Colors.black26),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      c['title']!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _PromoSale extends StatelessWidget {
  const _PromoSale();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Winter Sale is on!'),
      subtitle: const Text('Up to 40% off selected items.'),
      trailing: FilledButton(
        onPressed: () => Navigator.pushNamed(context, '/sale'),
        child: const Text('Shop Sale'),
      ),
    );
  }
}
