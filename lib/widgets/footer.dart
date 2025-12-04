import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: const Wrap(
        spacing: 24,
        runSpacing: 12,
        children: [
          _FooterLink(label: 'Privacy'),
          _FooterLink(label: 'Terms'),
          _FooterLink(label: 'Contact'),
          _FooterLink(label: 'Search'),
          SizedBox(width: 16),
          Text('Placeholder Footer'),
          Text('Students should customise this footer section'),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;
  const _FooterLink({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            decoration: TextDecoration.underline,
          ),
    );
  }
}
