import 'package:flutter/material.dart';
import '../../widgets/navbar.dart';
import '../../widgets/footer.dart';
import '../../styles/text_styles.dart';

class AboutPrintShackPage extends StatelessWidget {
  const AboutPrintShackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: const [
          Text('About Print Shack', style: AppTextStyles.h2),
          SizedBox(height: 12),
          Text(
              'Print Shack lets you personalize apparel and accessories with custom text and colors.'),
          SizedBox(height: 24),
          Footer(),
        ],
      ),
    );
  }
}
