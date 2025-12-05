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
            title: const Text('union shop'),
            actions: [
              IconButton(
                icon: const Icon(Icons.person_outline),
                onPressed: () => Navigator.pushNamed(context, '/signin'),
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () => Navigator.pushNamed(context, '/cart'),
              ),
            ],
          );
        }
        return AppBar(
          title: const Text('union shop'),
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
            TextButton(
                onPressed: () => Navigator.pushNamed(context, '/contact'),
                child: const Text('Contact')),
            IconButton(
                icon: const Icon(Icons.person_outline),
                onPressed: () => Navigator.pushNamed(context, '/signin')),
            IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () => Navigator.pushNamed(context, '/cart')),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
