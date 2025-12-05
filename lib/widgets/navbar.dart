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
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 32,
                  width: 32,
                  child: Image.asset(
                    'assets/images/upsu.webp',
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: const Text(
                    'union shop',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
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
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 36,
                width: 36,
                child: Image.asset(
                  'assets/images/upsu.webp',
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                ),
              ),
              const SizedBox(width: 12),
              Flexible(
                child: const Text(
                  'union shop',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
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
