import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';

class AccountPagePlaceholder extends StatelessWidget {
  const AccountPagePlaceholder({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Navbar(),
      body: Center(child: Text('Account (Phase 3)')),
      bottomNavigationBar: Footer(),
    );
  }
}
