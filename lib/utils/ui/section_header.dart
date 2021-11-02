import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    Key? key,
    required this.title,
    required this.iconData,
    this.trailing,
  }) : super(key: key);

  final String title;
  final IconData iconData;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Icon(iconData),
          const SizedBox(width: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          const Spacer(),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
