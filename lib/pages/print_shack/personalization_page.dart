import 'package:flutter/material.dart';
import '../../widgets/navbar.dart';
import '../../widgets/footer.dart';

class PersonalizationPage extends StatefulWidget {
  const PersonalizationPage({super.key});

  @override
  State<PersonalizationPage> createState() => _PersonalizationPageState();
}

class _PersonalizationPageState extends State<PersonalizationPage> {
  String text = 'Your Text Here';
  String font = 'Roboto';
  Color color = Colors.black;
  double size = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Print Shack Personalisation',
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          TextFormField(
            initialValue: text,
            decoration: const InputDecoration(labelText: 'Text'),
            onChanged: (v) => setState(() => text = v),
          ),
          const SizedBox(height: 16),
          DropdownButton<String>(
            value: font,
            items: const [
              DropdownMenuItem(value: 'Roboto', child: Text('Roboto')),
              DropdownMenuItem(value: 'Courier', child: Text('Courier')),
              DropdownMenuItem(value: 'Times', child: Text('Times')),
            ],
            onChanged: (v) => setState(() => font = v ?? font),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text('Color:'),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () => setState(() => color = Colors.black),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: const Text(''),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () => setState(() => color = Colors.red),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text(''),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () => setState(() => color = Colors.blue),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text(''),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Slider(
            value: size,
            min: 12,
            max: 48,
            divisions: 6,
            label: '${size.round()}',
            onChanged: (v) => setState(() => size = v),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey.shade200,
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                fontFamily: font,
                fontSize: size,
                color: color,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Footer(),
        ],
      ),
    );
  }
}
