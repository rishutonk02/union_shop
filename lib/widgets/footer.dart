import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      padding: const EdgeInsets.all(24),
      alignment: Alignment.center,
      child: const Text('© 2025 union shop – All rights reserved'),
    );
  }
}
