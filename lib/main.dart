import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/cart_service.dart';
import 'services/auth_service.dart';
import 'app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => CartService()),
      ],
      child: const UnionShopApp(),
    ),
  );
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Listen for auth changes and update cart
    final auth = context.watch<AuthService>();
    final cart = context.read<CartService>();
    // Schedule setUser after build to avoid notifying listeners during build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cart.setUser(auth.user?.uid);
    });

    return MaterialApp(
      title: 'Union Shop Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00695c)),
        useMaterial3: true,
      ),
      initialRoute: '/',
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
