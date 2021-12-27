import 'package:flutter/material.dart';
import 'package:smart_kitchen/app/resources/text_styles.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    Key? key,
    required this.title,
    this.iconData,
    this.trailing,
  }) : super(key: key);

  final String title;
  final IconData? iconData;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          if (iconData != null) ...[
            Icon(iconData),
            const SizedBox(width: 16),
          ],
          Text(
            title.toUpperCase(),
            style: TextStyles.sectionHeader,
          ),
          const Spacer(),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
