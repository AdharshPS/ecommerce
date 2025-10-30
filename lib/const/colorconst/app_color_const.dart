import 'package:flutter/material.dart';

class AppColorConst {
  static Color primary = Colors.amber;
  static Color scoundary = const Color.fromARGB(255, 145, 109, 3);
  static Gradient gradient = LinearGradient(
    colors: [primary, scoundary],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
