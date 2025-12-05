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
        padding: const EdgeInsets.all(24),
        children: const [
          Text('About Union Shop',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Text(
            'Welcome to the Union Shop — a student-run store supporting campus life. '
            'We offer merchandise, clothing, and accessories created for students, alumni, '
            'and friends of the university. Profits help fund student activities and campus initiatives.\n\n'
            'This project is also an educational showcase: it demonstrates responsive Flutter web '
            'design, client-side routing, state management, and basic e‑commerce flows used in '
            'coursework and student projects. If you have questions or want to get involved, '
            'please visit the Contact page or email hello@unionshop.example.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 24),
          Footer(),
        ],
      ),
    );
  }
}
