import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  Color get backgroundColor => isDark ? Colors.grey[800]! : Colors.grey[200]!;
  double get width => MediaQuery.of(this).size.width;

  ThemeData get theme => Theme.of(this);
  Color get primaryColor => theme.primaryColor;
}
