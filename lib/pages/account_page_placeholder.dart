import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';

class AccountPagePlaceholder extends StatelessWidget {
  const AccountPagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: const [
          Text('Account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text(
              'This is a placeholder. In Phase 3, this will show your orders, saved addresses, etc.'),
          SizedBox(height: 24),
          Footer(),
        ],
      ),
    );
  }
}
