import 'package:flutter/material.dart';
import 'package:smart_kitchen/app/resources/color_palette.dart';
import 'package:smart_kitchen/app/resources/paddings.dart';
import 'package:smart_kitchen/app/resources/text_styles.dart';
import 'package:smart_kitchen/app/resources/theme.dart';

class StandardTextField extends StatefulWidget {
  const StandardTextField({
    Key? key,
    required this.initialValue,
    this.iconData = Icons.clear,
    required this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.errorText,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.minLines = 1,
  })  : assert(
            maxLines >= minLines, 'Max lines cannot be lower than min lines'),
        super(key: key);

  final String initialValue;
  final IconData iconData;
  final String hintText;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputType keyboardType;
  final int maxLines;
  final int minLines;

  @override
  State<StandardTextField> createState() => _StandardTextFieldState();
}

class _StandardTextFieldState extends State<StandardTextField> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = widget.initialValue;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      style: TextStyles.textField,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        } else {
          setState(() {});
        }
      },
      onSubmitted: widget.onSubmitted != null
          ? (value) {
              if (_controller.text.isNotEmpty) {
                widget.onSubmitted!(value);
                _controller.clear();
              }
            }
          : null,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        border: AppTheme.outlinedBorder,
        hintText: widget.hintText,
        errorText: widget.errorText,
        filled: true,
        fillColor: ColorPalette.white,
        contentPadding: Paddings.all8,
        suffixIcon:
            widget.onChanged != null ? _suffixClearIcon() : _suffixSubmitIcon(),
      ),
    );
  }

  Widget _suffixSubmitIcon() {
    return IconButton(
      onPressed: _controller.text.isNotEmpty
          ? () {
              widget.onSubmitted!(_controller.text);
              _controller.clear();
            }
          : null,
      icon: Icon(widget.iconData),
    );
  }

  Widget? _suffixClearIcon() {
    return _controller.text.isNotEmpty
        ? IconButton(
            onPressed: () {
              widget.onChanged!('');
              _controller.clear();
            },
            icon: Icon(widget.iconData),
          )
        : null;
  }
}
