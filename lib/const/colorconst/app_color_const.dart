import 'package:flutter/material.dart';

class AppColorConst {
  static Color primary = Color(0xFF673AB7);
  static Color scoundary = const Color(0xFFE040FB);
  static Gradient gradient = LinearGradient(
    colors: [primary, scoundary],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
