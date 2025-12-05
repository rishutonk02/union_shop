import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';
import '../widgets/product_card.dart';
import '../services/data_service.dart';
import '../models/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> featured =
        DataService.getCollections().expand((c) => c.products).take(4).toList();

    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width < 600 ? 2 : 4;

    return Scaffold(
      appBar: const Navbar(),
      body: ListView(
        children: [
          SizedBox(
            height: 400,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/upsu.webp'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(color: Colors.black54),
                  ),
                ),
                Positioned(
                  left: 24,
                  right: 24,
                  top: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome to union shop',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Your one‑stop shop for student gear and merch.',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/collections'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00695c),
                          foregroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                        ),
                        child: const Text('BROWSE COLLECTIONS'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Featured Products',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.7,
                  children: featured.map((p) {
                    return ProductCard(
                      id: p.id,
                      title: p.title,
                      price: p.salePrice ?? p.price,
                      imageUrl: p.images.first,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}
