import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:smart_kitchen/app/navigation/navigation.dart';
import 'package:smart_kitchen/app/resources/strings.dart';
import 'package:smart_kitchen/models/ingredient/ingredient.dart';
import 'package:smart_kitchen/models/step/recipe_step.dart';
import 'package:smart_kitchen/pages/new_recipe/bloc/new_recipe_cubit.dart';
import 'package:smart_kitchen/pages/new_recipe/bloc/new_recipe_state.dart';
import 'package:smart_kitchen/utils/ui/new_recipe_ui.dart';
import 'package:smart_kitchen/utils/ui/standard_text_field.dart';

class StepsInput extends StatelessWidget {
  const StepsInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<NewRecipeCubit>(context);
    return BlocConsumer<NewRecipeCubit, NewRecipeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(Strings.cookSteps),
            actions: [
              IconButton(
                  onPressed: () => Navigation.instance.pop(),
                  icon: const Icon(Icons.save)),
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
      children: [
        if (!state.isAllIngredientsSelected)
          Padding(
            padding: const EdgeInsets.all(8),
            child:
                Text(Strings.unusedIngredientsCount(state.unusedIngredients)),
          ),
        Expanded(
          child: _recipeStepsList(context, cubit, state),
        ),
        _newStepField(context, cubit, state),
      ],
    );
  }

  Widget _recipeStepsList(
    BuildContext context,
    NewRecipeCubit cubit,
    NewRecipeState state,
  ) {
    return state.steps.isNotEmpty
        ? ListView.separated(
            itemBuilder: (context, index) {
              final step = state.steps[index];
              return RecipeStepTile(
                index: index,
                step: step,
                cubit: cubit,
                isEditable: true,
                onMore: () => _optionsBottomSheet(context, cubit, state, step),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: state.steps.length,
          )
        : const Center(
            child: Text(Strings.emptyRecipeStepsList),
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
                  keyboardType: TextInputType.multiline,
                  hintText: Strings.newCookStepHint,
                  onChanged: (value) => input = value,
                  maxLines: 5,
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

  Widget _newStepField(
    BuildContext context,
    NewRecipeCubit cubit,
    NewRecipeState state,
  ) {
    return StandardTextField(
      initialValue: '',
      hintText: Strings.newCookStepHint,
      iconData: Icons.send,
      onSubmitted: cubit.addStepFromInput,
      maxLines: 5,
      keyboardType: TextInputType.multiline,
    );
  }

  void _optionsBottomSheet(
    BuildContext context,
    NewRecipeCubit cubit,
    NewRecipeState state,
    RecipeStep step,
  ) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(Strings.editRecipeStepContent),
              onTap: () {
                Navigation.instance.pop();
                _editDialog(context, cubit, step);
              },
            ),
            ListTile(
              leading: const Icon(Icons.timer),
              title: const Text(Strings.setRecipeStepTimer),
              onTap: () {
                Navigation.instance.pop();
                _setStepTimer(context, cubit, state, step);
              },
            ),
            ListTile(
              leading: const Icon(Icons.assignment_outlined),
              title: const Text(Strings.setRecipeStepIngredients),
              onTap: () {
                Navigation.instance.pop();
                _setCookStepIngredients(context, cubit, state, step);
              },
            ),
          ],
        );
      },
    );
  }

  void _setStepTimer(
    BuildContext context,
    NewRecipeCubit cubit,
    NewRecipeState state,
    RecipeStep step,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) {
        var timer = 0;
        return StatefulBuilder(
          builder: (context, setState) {
            return SimpleDialog(
              children: [
                const Center(child: Text(Strings.setRecipeStepTimer)),
                NumberPicker(
                  minValue: 0,
                  maxValue: 1000,
                  value: timer,
                  textMapper: (value) => '$value min',
                  onChanged: (value) => setState(() => timer = value),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    cubit.setStepTimer(step, timer);
                  },
                  child: const Text(Strings.save),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _setCookStepIngredients(
    BuildContext context,
    NewRecipeCubit cubit,
    NewRecipeState state,
    RecipeStep step,
  ) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return BlocConsumer<NewRecipeCubit, NewRecipeState>(
          builder: (context, state) {
            final avaiableIngredients = state.stepAvailableIngredients(step.id);
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(Strings.setRecipeStepIngredients),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: avaiableIngredients.length,
                    itemBuilder: (context, index) {
                      final ingredient = avaiableIngredients[index];
                      return CheckboxListTile(
                        value: state
                            .stepIngredientIds(step.id)
                            .contains(ingredient.id),
                        onChanged: (value) {
                          if (value != null) {
                            cubit.processStepIngredient(
                              step,
                              ingredient,
                              value,
                            );
                          }
                        },
                        title: Text(ingredient.show),
                      );
                    },
                  ),
                )
              ],
            );
          },
          listener: (context, state) {},
        );
      },
    );
  }
}
