import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthService>();

    return Scaffold(
      appBar: const Navbar(),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('Account', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          if (auth.user != null) ...[
            Text('Signed in as: ${auth.user!.email}'),
            const SizedBox(height: 12),
            FilledButton(
              onPressed: () => auth.signOut(),
              child: const Text('Sign Out'),
            ),
          ] else
            const Text('Not signed in'),
          const SizedBox(height: 24),
          const Footer(),
        ],
      ),
    );
  }
}
