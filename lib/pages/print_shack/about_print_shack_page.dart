import 'package:flutter/material.dart';
import '../../widgets/navbar.dart';
import '../../widgets/footer.dart';

class AboutPrintShackPage extends StatelessWidget {
  const AboutPrintShackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text('About Print Shack',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text(
              'Print Shack lets you personalise products with custom text, fonts, and colours.'),
          SizedBox(height: 12),
          Text(
              'This page explains the service and how to use the personalisation tool.'),
          SizedBox(height: 24),
          Footer(),
        ],
      ),
    );
  }
}
