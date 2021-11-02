import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/app/resources/strings.dart';
import 'package:smart_kitchen/pages/recipes/bloc/recipes_cubit.dart';
import 'package:smart_kitchen/pages/recipes/bloc/recipes_state.dart';
import 'package:smart_kitchen/utils/scoped_bloc_builder.dart';
import 'package:smart_kitchen/utils/ui/category_chips.dart';
import 'package:smart_kitchen/utils/ui/recipe_card.dart';
import 'package:smart_kitchen/utils/ui/standard_text_field.dart';

const popUpItems = [
  PopupMenuItem(
    value: 'new',
    child: Text(Strings.newRecipe),
  ),
  PopupMenuItem(
    value: 'shuffle',
    child: Text(Strings.randomRecipe),
  ),
  PopupMenuItem(
    value: 'fridge',
    child: Text(Strings.fromFridge),
  )
];

class RecipesPage extends StatelessWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedBlocBuilder<RecipesCubit, RecipesState>(
      create: (_) => BlocProvider.of<RecipesCubit>(context)..fetchRecipes(),
      builder: (context, state, cubit) {
        return Scaffold(
          appBar: AppBar(
            title: StandardTextField(
              hintText: Strings.searchRecipe,
              initialValue: state.searchString ?? '',
              key: const Key(Strings.searchRecipe),
              onChanged: (value) => cubit.changeSearchString(value),
            ),
            actions: !state.isSearching
                ? [
                    PopupMenuButton<String>(
                      onSelected: (selected) {
                        if (selected == 'new') {
                          cubit.createNewRecipe();
                        }
                      },
                      child: const Icon(
                        Icons.more_vert,
                        size: 26,
                      ),
                      itemBuilder: (context) => popUpItems,
                    ),
                  ]
                : null,
          ),
          body: state.isSearching
              ? _searchRecipes(context, state, cubit)
              : _recipes(context, state, cubit),
        );
      },
    );
  }

  Widget _searchRecipes(
    BuildContext context,
    RecipesState state,
    RecipesCubit cubit,
  ) {
    return SizedBox(
      child: state.filteredRecipes.isNotEmpty
          ? ListView.builder(
              itemCount: state.filteredRecipes.length,
              itemBuilder: (context, index) {
                final recipe = state.filteredRecipes[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 16,
                  ),
                  child: RecipeCard(recipe: recipe),
                );
              },
            )
          : const Center(child: Text(Strings.noRecipes)),
    );
  }

  Widget _recipes(
    BuildContext context,
    RecipesState state,
    RecipesCubit cubit,
  ) {
    return Column(
      children: [
        categoryChips(context, state, cubit),
        Expanded(child: showRecipes(context, state, cubit)),
      ],
    );
  }

  Widget categoryChips(
    BuildContext context,
    RecipesState state,
    RecipesCubit cubit,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: CategoryChips(
        selectedCategory: state.selectedCategory,
        onCategoryChanged: cubit.changeCategory,
      ),
    );
  }

  Widget showRecipes(
    BuildContext context,
    RecipesState state,
    RecipesCubit cubit,
  ) {
    return state.categoryCount > 0
        ? ListView.builder(
            itemCount: state.categoryCount,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 16,
                ),
                child: RecipeCard(recipe: state.categoryRecipes[index]),
              );
            },
          )
        : const Center(
            child: Text(Strings.noRecipes),
          );
  }
}
