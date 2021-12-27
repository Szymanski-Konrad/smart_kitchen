import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/app/navigation/navigation.dart';
import 'package:smart_kitchen/app/resources/strings.dart';
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
        ? ListView.separated(
            itemCount: state.ingredients.length,
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemBuilder: (context, index) {
              return IngredientTile(
                ingredient: state.ingredients[index],
                cubit: cubit,
                isEditable: true,
              );
            },
          )
        : const Center(child: Text(Strings.emptyIngredientsList));
  }

  Widget _newIngredientField(
    BuildContext context,
    NewRecipeCubit cubit,
    NewRecipeState state,
  ) {
    return StandardTextField(
      initialValue: '',
      hintText: Strings.newIngredientHint,
      iconData: Icons.send,
      onSubmitted: cubit.parseIngredientInput,
    );
  }
}
