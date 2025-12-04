import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/about_page.dart';
// ignore: unused_import
import 'pages/collections_page.dart';
import 'pages/product_page.dart' as product;
import 'pages/cart_page_placeholder.dart';
import 'pages/sale_page.dart';
import 'pages/signin_page.dart';
import 'pages/signup_page.dart';
import 'pages/account_page_placeholder.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final uri = Uri.parse(settings.name ?? '/');
    switch (uri.path) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/about':
        return MaterialPageRoute(builder: (_) => const AboutPage());
      case '/collections':
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  appBar: AppBar(title: const Text('Collections')),
                  body: const Center(child: Text('Collections index')),
                ));
      case '/sale':
        return MaterialPageRoute(builder: (_) => const SalePage());
      case '/signin':
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case '/cart':
        return MaterialPageRoute(builder: (_) => const CartPagePlaceholder());
      case '/account':
        return MaterialPageRoute(
            builder: (_) => const AccountPagePlaceholder());
      default:
        if (uri.pathSegments.length == 2) {
          if (uri.pathSegments.first == 'product') {
            final id = uri.pathSegments[1];
            return MaterialPageRoute(
                builder: (_) => product.ProductPage(productId: id));
          }
          if (uri.pathSegments.first == 'collections') {
            final id = uri.pathSegments[1];
            return MaterialPageRoute(
                builder: (_) => CollectionPage(collectionId: id));
          }
        }
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text('Not found')),
            body: const Center(child: Text('Page not found')),
          ),
        );
    }
  }
}

class CollectionPage extends StatelessWidget {
  final String collectionId;

  const CollectionPage({Key? key, required this.collectionId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Collection: $collectionId')),
      body: Center(child: Text('Collection details for $collectionId')),
    );
  }
}
