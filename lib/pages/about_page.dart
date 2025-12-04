import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text('About Us',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text(
              'We are the Student Union shop. This app is a coursework recreation using Flutter.'),
          SizedBox(height: 12),
          Text('Opening hours: Mon–Fri 9:00–17:00'),
          SizedBox(height: 24),
          Footer(),
        ],
      ),
    );
  }
}
