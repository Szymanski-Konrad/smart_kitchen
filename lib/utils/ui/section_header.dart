import 'package:flutter/material.dart';
import 'package:smart_kitchen/app/resources/paddings.dart';
import 'package:smart_kitchen/app/resources/spacings.dart';
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
      padding: Paddings.vertical16,
      child: Row(
        children: [
          if (iconData != null) ...[
            Icon(iconData),
            Spacings.s16,
          ],
          Text(
            title,
            style: TextStyles.sectionHeader,
          ),
          const Spacer(),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

class SmallSectionHeader extends StatelessWidget {
  const SmallSectionHeader({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.vertical16,
      child: Text(
        title,
        style: TextStyles.smallSectionHeader,
      ),
    );
  }
}
