import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/app/navigation/navigation.dart';
import 'package:smart_kitchen/app/resources/strings.dart';
import 'package:smart_kitchen/app/resources/text_styles.dart';
import 'package:smart_kitchen/models/ingredient/ingredient.dart';
import 'package:smart_kitchen/models/recipe/recipe_section.dart';
import 'package:smart_kitchen/pages/new_recipe/bloc/new_recipe_cubit.dart';
import 'package:smart_kitchen/pages/new_recipe/bloc/new_recipe_state.dart';
import 'package:smart_kitchen/utils/ui/new_recipe_ui.dart';
import 'package:smart_kitchen/utils/ui/standard_text_field.dart';

class IngredientsInput extends StatelessWidget {
  const IngredientsInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<NewRecipeCubit>(context);
    return BlocConsumer<NewRecipeCubit, NewRecipeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(Strings.ingredients),
            actions: [
              IconButton(
                onPressed: () => Navigation.instance.pop(),
                icon: const Icon(Icons.save),
              ),
            ],
          ),
          body: _buildContent(context, cubit, state),
        );
      },
      listener: (context, state) {},
    );
  }

  Widget _buildContent(
    BuildContext context,
    NewRecipeCubit cubit,
    NewRecipeState state,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: _ingredientsList(context, cubit, state),
        ),
        _newIngredientField(context, cubit, state),
      ],
    );
  }

  Widget _ingredientsList(
    BuildContext context,
    NewRecipeCubit cubit,
    NewRecipeState state,
  ) {
    return state.ingredients.isNotEmpty
        ? SingleChildScrollView(
            child: Column(
              children: [
                SectionIngredients(
                  section: null,
                  ingredients: state.sectionIngredients(null),
                  onRemove: cubit.removeIngredient,
                  showName: state.sections.isNotEmpty,
                ),
                if (state.sections.isNotEmpty)
                  ...state.sections.map((e) => SectionIngredients(
                        section: e,
                        ingredients: state.sectionIngredients(e.id),
                        onRemove: cubit.removeIngredient,
                        onSectionRemove: () => cubit.removeSection(e.id),
                      )),
              ],
            ),
          )
        : const Center(child: Text(Strings.emptyIngredientsList));
  }

  Widget _newIngredientField(
    BuildContext context,
    NewRecipeCubit cubit,
    NewRecipeState state,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: StandardTextField(
        initialValue: '',
        hintText: Strings.newIngredientHint,
        iconData: Icons.send,
        onSubmitted: cubit.parseIngredientInput,
      ),
    );
  }
}

class SectionIngredients extends StatelessWidget {
  const SectionIngredients({
    Key? key,
    required this.section,
    required this.ingredients,
    required this.onRemove,
    this.onSectionRemove,
    this.showName = true,
  }) : super(key: key);

  final RecipeSection? section;
  final List<Ingredient> ingredients;
  final Function(Ingredient) onRemove;
  final VoidCallback? onSectionRemove;
  final bool showName;

  @override
  Widget build(BuildContext context) {
    final sectionName = section?.name;
    return Column(
      children: [
        if (showName)
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                if (onSectionRemove != null)
                  IconButton(
                    onPressed: onSectionRemove,
                    icon: const Icon(Icons.delete),
                  ),
                Expanded(
                  child: Text(
                    sectionName ?? 'Unassigned ingredients',
                    style: TextStyles.sectionHeader,
                  ),
                ),
              ],
            ),
          ),
        ...ingredients.map((e) => IngredientTile(
              ingredient: e,
              onRemove: () => onRemove(e),
            )),
      ],
    );
  }
}
