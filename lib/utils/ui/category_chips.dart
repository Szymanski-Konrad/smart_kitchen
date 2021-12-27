import 'package:flutter/material.dart';
import 'package:smart_kitchen/app/resources/color_palette.dart';
import 'package:smart_kitchen/app/resources/dimensions.dart';
import 'package:smart_kitchen/app/resources/paddings.dart';
import 'package:smart_kitchen/app/resources/spacings.dart';
import 'package:smart_kitchen/app/resources/text_styles.dart';
import 'package:smart_kitchen/models/recipe/category.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({
    Key? key,
    required this.selectedCategory,
    required this.onCategoryChanged,
  }) : super(key: key);

  final Category selectedCategory;
  final Function(Category) onCategoryChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        padding: Paddings.horizontal16,
        separatorBuilder: (context, index) => Spacings.s16,
        scrollDirection: Axis.horizontal,
        itemCount: Category.values.length,
        itemBuilder: (context, index) {
          final category = Category.values[index];
          return GestureDetector(
            onTap: () => onCategoryChanged(Category.values[index]),
            child: CategoryChip(
              category: category,
              isSelected: category == selectedCategory,
            ),
          );
        },
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    Key? key,
    required this.category,
    required this.isSelected,
  }) : super(key: key);

  final Category category;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: Paddings.chipPadding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.d8),
      ),
      backgroundColor: isSelected ? ColorPalette.green : ColorPalette.wheat,
      label: Text(
        category.name,
        style: isSelected ? TextStyles.chipItemSelected : TextStyles.chipItem,
        textAlign: TextAlign.center,
      ),
    );
  }
}
