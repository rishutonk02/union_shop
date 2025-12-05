import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'pages/collections_page.dart';
import 'pages/collection_page.dart';
import 'pages/product_page.dart';
import 'pages/sale_page.dart';
import 'pages/cart_page.dart';
import 'pages/auth/sign_in_page.dart';
import 'pages/auth/sign_up_page.dart';
import 'pages/account_page_placeholder.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final uri = Uri.parse(settings.name ?? '/');

    switch (uri.path) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/about':
        return MaterialPageRoute(builder: (_) => const AboutPage());
      case '/contact':
        return MaterialPageRoute(builder: (_) => const ContactPage());
      case '/collections':
        return MaterialPageRoute(builder: (_) => const CollectionsPage());
      case '/sale':
        return MaterialPageRoute(builder: (_) => const SalePage());
      case '/cart':
        return MaterialPageRoute(builder: (_) => const CartPage());
      case '/signin':
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case '/account':
        return MaterialPageRoute(builder: (_) => const AccountPage());
      default:
        if (uri.pathSegments.length == 2) {
          if (uri.pathSegments.first == 'collections') {
            final id = uri.pathSegments[1];
            return MaterialPageRoute(
                builder: (_) => CollectionPage(collectionId: id));
          }
          if (uri.pathSegments.first == 'product') {
            final id = uri.pathSegments[1];
            return MaterialPageRoute(
                builder: (_) => ProductPage(productId: id));
          }
        }
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
