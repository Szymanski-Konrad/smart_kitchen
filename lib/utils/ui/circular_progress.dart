import 'package:flutter/material.dart';
import 'package:smart_kitchen/app/resources/color_palette.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: ColorPalette.accent,
    );
  }
}
