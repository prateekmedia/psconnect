import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  // General Extensions
  ThemeData get theme => Theme.of(this);
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  double get width => MediaQuery.of(this).size.width;

  // Color Related Extensions
  Color get primaryColor => theme.primaryColor;
  Color get backgroundColor => isDark ? Colors.grey[800]! : Colors.grey[200]!;
  Color get successColor => Colors.green[isDark ? 400 : 600]!;
  Color get warningColor => Colors.red[isDark ? 400 : 600]!;
}
