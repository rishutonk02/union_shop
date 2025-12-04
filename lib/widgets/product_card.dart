import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String id, title, imageUrl;
  final double price;

  const ProductCard(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, '/product/$id'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Image.network(imageUrl,
                    fit: BoxFit.cover, width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
              return Container(color: Colors.grey[300]);
            })),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Text('£${price.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
