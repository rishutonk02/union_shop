import 'package:flutter/material.dart';
import '../../widgets/navbar.dart';
import '../../widgets/footer.dart';

class PersonalizationPage extends StatefulWidget {
  const PersonalizationPage({super.key});

  @override
  State<PersonalizationPage> createState() => _PersonalizationPageState();
}

class _PersonalizationPageState extends State<PersonalizationPage> {
  String text = 'Your Text';
  String font = 'Roboto';
  Color color = Colors.black;
  double size = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('Print Shack — Personalization',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          TextField(
            decoration: const InputDecoration(labelText: 'Text'),
            onChanged: (v) => setState(() => text = v),
          ),
          const SizedBox(height: 8),
          DropdownButton<String>(
            value: font,
            items: const [
              DropdownMenuItem(value: 'Roboto', child: Text('Roboto')),
              DropdownMenuItem(value: 'Montserrat', child: Text('Montserrat')),
            ],
            onChanged: (v) => setState(() => font = v ?? font),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text('Color: '),
              const SizedBox(width: 8),
              DropdownButton<Color>(
                value: color,
                items: const [
                  DropdownMenuItem(value: Colors.black, child: Text('Black')),
                  DropdownMenuItem(value: Colors.red, child: Text('Red')),
                  DropdownMenuItem(value: Colors.blue, child: Text('Blue')),
                ],
                onChanged: (v) => setState(() => color = v ?? color),
              ),
              const SizedBox(width: 24),
              const Text('Size: '),
              Slider(
                value: size,
                min: 12,
                max: 48,
                divisions: 12,
                label: size.toStringAsFixed(0),
                onChanged: (v) => setState(() => size = v),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 200,
            alignment: Alignment.center,
            color: Colors.grey.shade200,
            child: Text(
              text,
              style: TextStyle(fontSize: size, color: color, fontFamily: font),
            ),
          ),
          const SizedBox(height: 24),
          const Footer(),
        ],
      ),
    );
  }
}
