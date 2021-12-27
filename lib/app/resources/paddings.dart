import 'package:flutter/cupertino.dart';
import 'package:smart_kitchen/app/resources/dimensions.dart';

abstract class Paddings {
  Paddings._();

  static const chipPadding = EdgeInsets.symmetric(
    vertical: Dimensions.d4,
    horizontal: Dimensions.d8,
  );

  // All
  static const all8 = EdgeInsets.all(Dimensions.d8);
  static const all16 = EdgeInsets.all(Dimensions.d16);

  // Vertical
  static const vertical8 = EdgeInsets.symmetric(vertical: Dimensions.d8);
  static const vertical16 = EdgeInsets.symmetric(vertical: Dimensions.d16);

  // Horizontal
  static const horizontal8 = EdgeInsets.symmetric(horizontal: Dimensions.d8);
  static const horizontal16 = EdgeInsets.symmetric(horizontal: Dimensions.d16);
}
