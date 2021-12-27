import 'package:flutter/material.dart';
import 'package:smart_kitchen/app/resources/color_palette.dart';

abstract class TextStyles {
  TextStyles._();

  static const recipeName = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    height: 1.33,
  );

  static const recipeRating = TextStyle(
    fontSize: 16,
    fontStyle: FontStyle.italic,
    height: 1.33,
  );

  static const textField = TextStyle(
    color: ColorPalette.white,
    fontSize: 16,
    height: 1.33,
  );

  static const chipItem = TextStyle(
    fontSize: 16,
    color: ColorPalette.grey,
    height: 1.33,
  );

  static const chipItemSelected = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: ColorPalette.white,
    height: 1.33,
  );

  static const sectionHeader = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.33,
    color: Colors.black,
  );

  static const h1 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  )
}
