import 'package:flutter/material.dart';

abstract class ColorPalette {
  ColorPalette._();

  static const primary = Color(0xFFEE6C4D); // Primary - space
  static const buttons = Color(0xFF293241); // Buttons - yellowRed
  static const accent = Color(0xFFE0FBFC); // Accent - darkCyan
  static const background = Color(0xFF98C1D9); // Backgroud - sapphire
  static const dialogs = Color(0xFF417CA6); // Dialogs - grape
  static const errorColor = Color(0xFFD13C06); // Errors
  static const text = Color(0xFF3D5A80);

  static MaterialColor primarySwatch = MaterialColor(buttons.value, swatch);

  static Map<int, Color> swatch = {
    50: buttons.withOpacity(0.1),
    100: buttons.withOpacity(0.2),
    200: buttons.withOpacity(0.3),
    300: buttons.withOpacity(0.4),
    400: buttons.withOpacity(0.5),
    500: buttons.withOpacity(0.6),
    600: buttons.withOpacity(0.7),
    700: buttons.withOpacity(0.8),
    800: buttons.withOpacity(0.9),
    900: buttons.withOpacity(1),
  };
}
