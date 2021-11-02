import 'package:flutter/material.dart';
import 'package:smart_kitchen/app/resources/color_palette.dart';
import 'package:smart_kitchen/models/recipe/category.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips(
      {Key? key,
      required this.selectedCategory,
      required this.onCategoryChanged})
      : super(key: key);

  final Category selectedCategory;
  final Function(Category) onCategoryChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Category.values.length,
        itemBuilder: (context, index) {
          final category = Category.values[index];
          return GestureDetector(
            onTap: () => onCategoryChanged(Category.values[index]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: CategoryChip(
                category: category,
                isSelected: category == selectedCategory,
              ),
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
      backgroundColor: isSelected ? ColorPalette.accent : Colors.transparent,
      label: Text(category.name),
      avatar: isSelected
          ? CircleAvatar(
              child: Text(category.name[0].toUpperCase()),
            )
          : null,
    );
  }
}
