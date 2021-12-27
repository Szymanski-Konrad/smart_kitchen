import 'package:flutter/material.dart';
import 'package:smart_kitchen/app/navigation/navigation.dart';
import 'package:smart_kitchen/app/resources/strings.dart';
import 'package:smart_kitchen/models/ingredient/ingredient.dart';
import 'package:smart_kitchen/models/step/recipe_step.dart';
import 'package:smart_kitchen/pages/new_recipe/bloc/new_recipe_cubit.dart';
import 'package:smart_kitchen/utils/ui/standard_text_field.dart';

class IngredientTile extends StatelessWidget {
  const IngredientTile({
    Key? key,
    required this.ingredient,
    required this.cubit,
    this.isEditable = false,
  }) : super(key: key);

  final Ingredient ingredient;
  final NewRecipeCubit cubit;
  final bool isEditable;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(ingredient.show),
      onTap: isEditable ? () => _editDialog(context, cubit, ingredient) : null,
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        onPressed: () => cubit.removeIngredient(ingredient),
      ),
    );
  }

  void _editDialog(
    BuildContext context,
    NewRecipeCubit cubit,
    Ingredient ingredient,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) {
        var input = ingredient.show;
        return StatefulBuilder(
          builder: (context, setState) {
            return SimpleDialog(
              title: const Text(Strings.editIngredient),
              children: [
                StandardTextField(
                  hintText: Strings.newIngredientHint,
                  initialValue: input,
                  onChanged: (value) {
                    input = value;
                  },
                ),
                MaterialButton(
                  child: const Text(Strings.save),
                  onPressed: () {
                    cubit.updateIngredientFromInput(input, ingredient);
                    Navigation.instance.pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class RecipeStepTile extends StatelessWidget {
  const RecipeStepTile({
    Key? key,
    required this.step,
    required this.cubit,
    required this.index,
    this.isEditable = false,
    this.onMore,
  }) : super(key: key);

  final RecipeStep step;
  final int index;
  final NewRecipeCubit cubit;
  final VoidCallback? onMore;
  final bool isEditable;

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
      onTap: () => _editDialog(context, cubit, step),
      trailing: IconButton(
        icon: Icon(onMore != null ? Icons.more_horiz : Icons.delete_outline),
        onPressed: () => onMore != null ? onMore!() : cubit.removeStep(step),
      ),
    );
  }

  void _editDialog(
    BuildContext context,
    NewRecipeCubit cubit,
    RecipeStep step,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) {
        var input = step.content;
        return StatefulBuilder(
          builder: (context, setState) {
            return SimpleDialog(
              title: const Text(Strings.editCookStep),
              children: [
                StandardTextField(
                  initialValue: input,
                  hintText: Strings.newCookStepHint,
                  onChanged: (value) => input = value,
                ),
                MaterialButton(
                  onPressed: () => cubit.updateStepFromInput(input, step),
                  child: const Text(Strings.save),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
