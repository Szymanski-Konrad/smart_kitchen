import 'package:flutter/material.dart';
import 'package:smart_kitchen/app/resources/color_palette.dart';
import 'package:smart_kitchen/app/resources/constants.dart';
import 'package:smart_kitchen/app/resources/dimensions.dart';
import 'package:smart_kitchen/app/resources/paddings.dart';
import 'package:smart_kitchen/app/resources/text_styles.dart';
import 'package:smart_kitchen/app/resources/theme.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    Key? key,
    required this.initialValue,
    this.iconData = Icons.clear,
    required this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.errorText,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
  })  : assert(onChanged != null || onSubmitted != null),
        super(key: key);

  final String initialValue;
  final IconData iconData;
  final String hintText;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputType keyboardType;
  final int maxLines;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = widget.initialValue;
    super.initState();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constants.searchTextFieldSize,
      child: TextField(
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
        minLines: 1,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          border: AppTheme.outlinedBorder,
          focusedBorder: AppTheme.outlinedBorder,
          fillColor: ColorPalette.white,
          hintText: widget.hintText,
          errorText: widget.errorText,
          filled: true,
          contentPadding: Paddings.all8,
          prefixIcon: _prefixSearchIcon,
          suffixIcon:
              widget.onChanged != null ? _suffixClearIcon : _suffixSubmitIcon,
        ),
      ),
    );
  }

  Widget? get _prefixSearchIcon {
    return const Icon(
      Icons.search,
      color: ColorPalette.green,
    );
  }

  Widget get _suffixSubmitIcon {
    return IconButton(
      onPressed: _controller.text.isNotEmpty
          ? () {
              widget.onSubmitted!(_controller.text);
              _controller.clear();
            }
          : null,
      icon: Icon(
        widget.iconData,
        color: ColorPalette.white,
      ),
    );
  }

  Widget? get _suffixClearIcon {
    return _controller.text.isNotEmpty
        ? IconButton(
            onPressed: () {
              widget.onChanged!('');
              _controller.clear();
            },
            icon: Icon(
              widget.iconData,
              color: ColorPalette.white,
            ),
          )
        : null;
  }
}
