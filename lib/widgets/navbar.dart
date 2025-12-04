import 'package:flutter/material.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final isMobile = constraints.maxWidth < 800;
        if (isMobile) {
          return AppBar(
            title: const Text('PLACEHOLDER HEADER TEXT - STUDENTS TO UPDATE!'),
            actions: [
              IconButton(icon: const Icon(Icons.search), onPressed: () {}),
              IconButton(
                icon: const Icon(Icons.shopping_bag_outlined),
                onPressed: () => Navigator.pushNamed(context, '/cart'),
              ),
              IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
            ],
          );
        }
        return AppBar(
          title: const Text('PLACEHOLDER HEADER TEXT - STUDENTS TO UPDATE!'),
          toolbarHeight: 64,
          actions: [
            TextButton(
                onPressed: () => Navigator.pushNamed(context, '/'),
                child: const Text('Home')),
            TextButton(
                onPressed: () => Navigator.pushNamed(context, '/collections'),
                child: const Text('Collections')),
            TextButton(
                onPressed: () => Navigator.pushNamed(context, '/sale'),
                child: const Text('Sale')),
            TextButton(
                onPressed: () => Navigator.pushNamed(context, '/about'),
                child: const Text('About')),
            const SizedBox(width: 16),
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            IconButton(
                icon: const Icon(Icons.shopping_bag_outlined),
                onPressed: () => Navigator.pushNamed(context, '/cart')),
            IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
