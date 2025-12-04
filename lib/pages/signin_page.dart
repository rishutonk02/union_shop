import 'package:flutter/material.dart';
import '../widgets/navbar.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sign in', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 16),
            FilledButton.tonal(
              onPressed: () {
                // placeholder: no real auth in this starter app
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Sign-in pressed')));
              },
              child: const Text('Sign in'),
            ),
            const SizedBox(height: 8),
            TextButton(
                onPressed: () => Navigator.pushNamed(context, '/signup'),
                child: const Text('Create an account')),
          ],
        ),
      ),
    );
  }
}
