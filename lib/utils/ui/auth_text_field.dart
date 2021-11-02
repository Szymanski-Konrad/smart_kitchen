import 'package:flutter/material.dart';
import 'package:smart_kitchen/app/resources/color_palette.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    Key? key,
    required this.initialValue,
    required this.iconData,
    required this.hintText,
    this.obscureText = false,
    required this.onChanged,
    this.errorText,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final String initialValue;
  final IconData iconData;
  final String hintText;
  final bool obscureText;
  final String? errorText;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscureText,
      onChanged: (text) => widget.onChanged(text),
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        errorText: widget.errorText,
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        contentPadding: const EdgeInsets.all(8),
        prefixIcon: Container(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          margin: const EdgeInsets.only(right: 8),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Icon(
            widget.iconData,
            color: ColorPalette.buttons,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
