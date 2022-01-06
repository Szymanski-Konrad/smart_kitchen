import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_kitchen/app/resources/text_styles.dart';

abstract class PageFactory {
  const PageFactory._();

  static AppBar pageTitle({required String title, Widget? trailing}) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: GoogleFonts.adamina(textStyle: TextStyles.h1),
      ),
      actions: trailing != null ? [trailing] : null,
    );
  }
}
