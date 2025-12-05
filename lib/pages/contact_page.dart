import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text('Contact Us',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text('Email: support@unionshopclone.com'),
          Text('Phone: +44 1234 567890'),
          SizedBox(height: 24),
          Footer(),
        ],
      ),
    );
  }
}
