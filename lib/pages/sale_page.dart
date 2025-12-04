import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';

class SalePage extends StatelessWidget {
  const SalePage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(
        8,
        (i) => {
              'id': 's$i',
              'title': 'Sale Item ${i + 1}',
              'price': 9.99 + i * 2,
            });

    return Scaffold(
      appBar: const Navbar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Sale', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          const Text('Selected items on discount.'),
          const SizedBox(height: 12),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.75,
            children: items.map((p) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.grey[200],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(p['title']!.toString()),
                      Text('£${(p['price'] as double).toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          const Footer(),
        ],
      ),
    );
  }
}
