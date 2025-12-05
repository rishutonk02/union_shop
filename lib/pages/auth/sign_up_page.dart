import 'package:flutter/material.dart';
import '../../widgets/navbar.dart';
import '../../widgets/footer.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('Sign Up',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  onChanged: (v) => name = v,
                  validator: (v) =>
                      (v == null || v.isEmpty) ? 'Enter name' : null,
                ),
                const SizedBox(height: 12),
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
                      (v == null || v.length < 6) ? 'Min 6 chars' : null,
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Account created (mock)')));
                      Navigator.pushNamed(context, '/signin');
                    }
                  },
                  child: const Text('Create Account'),
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
