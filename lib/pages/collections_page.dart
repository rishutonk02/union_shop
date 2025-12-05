import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';
import '../services/data_service.dart';
import '../models/collection.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Collection> collections = DataService.getCollections();
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width < 600 ? 2 : 4;

    return Scaffold(
      appBar: const Navbar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text('Collections',
                style: Theme.of(context).textTheme.headlineSmall),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.8,
              children: collections.map((c) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, '/collections/${c.id}'),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            c.image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[300],
                                child: const Center(
                                    child: Icon(Icons.image_not_supported,
                                        color: Colors.grey)),
                              );
                            },
                          ),
                        ),
                        ListTile(
                            title: Text(c.title),
                            subtitle: Text(c.description)),
                      ],
                    ),
                  ),
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
