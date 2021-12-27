import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

abstract class ColorPalette {
  ColorPalette._();

  // redesign
  static const black = Color(0xFF050504);
  static const grey = Color(0xFF575655);
  static const lightBlack = Color(0xFFACB0BD);
  static const white = Color(0xFFFFFFFF);
  static const wheat = Color(0xFFF5DFBB);
  static const pumpkin = Color(0xFFF3752B);
  static const yellow = Color(0xFFFBB13C);
  static const green = Color(0xFF4EA699);
  static const blue = Color(0xFF140D4F);
  static const lightBlue = Color(0xFFF2F4F8);

  // static MaterialColor primarySwatch = MaterialColor(yellowRed.value, swatch);

  // static Map<int, Color> swatch = {
  //   50: yellowRed.withOpacity(0.1),
  //   100: yellowRed.withOpacity(0.2),
  //   200: yellowRed.withOpacity(0.3),
  //   300: yellowRed.withOpacity(0.4),
  //   400: yellowRed.withOpacity(0.5),
  //   500: yellowRed.withOpacity(0.6),
  //   600: yellowRed.withOpacity(0.7),
  //   700: yellowRed.withOpacity(0.8),
  //   800: yellowRed.withOpacity(0.9),
  //   900: yellowRed.withOpacity(1),
  // };
}
