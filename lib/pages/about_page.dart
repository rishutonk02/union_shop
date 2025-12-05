import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';
import '../styles/text_styles.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: const [
          Text('About union shop', style: AppTextStyles.h2),
          SizedBox(height: 16),
          Text(
            'Union Shop is a student‑run marketplace featuring apparel, accessories, and campus‑themed merchandise. '
            'This project is both a learning platform and a small storefront — built with Flutter for the web to demonstrate responsive design, accessible navigation, and straightforward e‑commerce interactions. '
            'Our merchandise helps fund student activities and gives students hands‑on experience with real‑world development workflows. '
            'Want to contribute, suggest a product, or report a bug? Visit the project repository or contact us at hello@unionshop.example. Thank you for supporting student development!',
            style: AppTextStyles.body,
          ),
          SizedBox(height: 24),
          Footer(),
        ],
      ),
    );
  }
}
