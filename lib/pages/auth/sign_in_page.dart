import 'package:flutter/material.dart';
import '../../widgets/navbar.dart';
import '../../widgets/footer.dart';
import '../../styles/text_styles.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('Sign In', style: AppTextStyles.h2),
          const SizedBox(height: 16),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  onChanged: (v) => email = v,
                  validator: (v) =>
                      (v == null || v.isEmpty) ? 'Enter email' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  onChanged: (v) => password = v,
                  validator: (v) =>
                      (v == null || v.isEmpty) ? 'Enter password' : null,
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Signed in (mock)')));
                      Navigator.pushNamed(context, '/account');
                    }
                  },
                  child: const Text('Sign In'),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/signup'),
                  child: const Text('Create an account'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Footer(),
        ],
      ),
    );
  }
}
