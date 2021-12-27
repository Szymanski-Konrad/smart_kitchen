import 'package:flutter/material.dart';
import 'package:smart_kitchen/app/resources/dimensions.dart';

abstract class AppTheme {
  const AppTheme._();

  static const outlinedBorder = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(Dimensions.d16)),
  );
}
