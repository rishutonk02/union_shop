import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle h1 =
      TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
  static const TextStyle h2 =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static const TextStyle h3 =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  static const TextStyle body = TextStyle(fontSize: 16);
  static const TextStyle bodySmall = TextStyle(fontSize: 14);

  static const TextStyle caption = TextStyle(fontSize: 13, color: Colors.grey);

  static const TextStyle productTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle productPrice = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Color(0xFF4d2963),
  );

  static const TextStyle productDescTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static const TextStyle productDesc = TextStyle(
    fontSize: 16,
    color: Colors.grey,
    height: 1.5,
  );

  static const TextStyle footer = TextStyle(
    color: Colors.grey,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}
