import 'package:flutter/material.dart';
import 'package:smart_kitchen/models/ingredient/ingredient.dart';
import 'package:smart_kitchen/models/step/recipe_step.dart';

class IngredientTile extends StatelessWidget {
  const IngredientTile({
    Key? key,
    required this.ingredient,
    this.onEdit,
    this.onRemove,
  }) : super(key: key);

  final Ingredient ingredient;
  final VoidCallback? onEdit;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(ingredient.show),
      onTap: onEdit,
      trailing: onRemove != null
          ? IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: onRemove,
            )
          : null,
    );
  }
}

class RecipeStepTile extends StatelessWidget {
  const RecipeStepTile({
    Key? key,
    required this.step,
    required this.index,
    this.onMore,
  }) : super(key: key);

  final RecipeStep step;
  final int index;
  final VoidCallback? onMore;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 12,
        child: Text('${index + 1}'),
      ),
      title: Text('${step.content}\n'),
      isThreeLine: true,
      subtitle: Text(step.stepInfoDesc),
      trailing: onMore != null
          ? IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: onMore,
            )
          : null,
    );
  }
}
