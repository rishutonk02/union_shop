import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';

class ProductPage extends StatefulWidget {
  final String productId;
  const ProductPage({super.key, required this.productId});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String size = 'M';
  String color = 'Black';
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    final images = [
      'https://picsum.photos/seed/${widget.productId}a/800/600',
      'https://picsum.photos/seed/${widget.productId}b/800/600',
    ];

    return Scaffold(
      appBar: const Navbar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Product: ${widget.productId}',
                style: Theme.of(context).textTheme.headlineSmall),
          ),
          _ImageGallery(images: images),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('£39.99',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Text('Size: '),
                    const SizedBox(width: 8),
                    DropdownButton<String>(
                      value: size,
                      items: const [
                        DropdownMenuItem(value: 'S', child: Text('S')),
                        DropdownMenuItem(value: 'M', child: Text('M')),
                        DropdownMenuItem(value: 'L', child: Text('L')),
                      ],
                      onChanged: (v) => setState(() => size = v ?? size),
                    ),
                    const SizedBox(width: 24),
                    const Text('Color: '),
                    const SizedBox(width: 8),
                    DropdownButton<String>(
                      value: color,
                      items: const [
                        DropdownMenuItem(value: 'Black', child: Text('Black')),
                        DropdownMenuItem(value: 'Blue', child: Text('Blue')),
                        DropdownMenuItem(value: 'Red', child: Text('Red')),
                      ],
                      onChanged: (v) => setState(() => color = v ?? color),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Text('Quantity: '),
                    const SizedBox(width: 8),
                    _QtyStepper(
                        qty: qty, onChange: (v) => setState(() => qty = v)),
                  ],
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Add to cart (Phase 2)')));
                  },
                  child: const Text('Add to Cart'),
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

class _ImageGallery extends StatefulWidget {
  final List<String> images;
  const _ImageGallery({required this.images});

  @override
  State<_ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<_ImageGallery> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 4 / 3,
          child: Image.network(widget.images[index], fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
            return Container(color: Colors.grey[300]);
          }),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: List.generate(widget.images.length, (i) {
            return GestureDetector(
              onTap: () => setState(() => index = i),
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: i == index
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey),
                ),
                child: Image.network(widget.images[i], fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                  return Container(color: Colors.grey[300]);
                }),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _QtyStepper extends StatelessWidget {
  final int qty;
  final ValueChanged<int> onChange;
  const _QtyStepper({Key? key, required this.qty, required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: qty > 1 ? () => onChange(qty - 1) : null,
        ),
        Text(qty.toString(), style: const TextStyle(fontSize: 16)),
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          onPressed: () => onChange(qty + 1),
        ),
      ],
    );
  }
}
FilledButton(
  onPressed: () {
    final product = DataService.getProduct(widget.productId);
    if (product != null) {
      context.read<CartService>().addItem(product, qty: qty);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added to cart')));
    }
  },
  child: const Text('Add to Cart'),
),
