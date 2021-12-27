import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/app/resources/color_palette.dart';
import 'package:smart_kitchen/app/resources/constants.dart';
import 'package:smart_kitchen/app/resources/dimensions.dart';
import 'package:smart_kitchen/app/resources/paddings.dart';
import 'package:smart_kitchen/app/resources/spacings.dart';
import 'package:smart_kitchen/app/resources/strings.dart';
import 'package:smart_kitchen/models/recipe/recipe.dart';
import 'package:smart_kitchen/pages/recipes/bloc/recipes_cubit.dart';
import 'package:smart_kitchen/pages/recipes/bloc/recipes_state.dart';
import 'package:smart_kitchen/utils/ui/category_chips.dart';
import 'package:smart_kitchen/utils/ui/recipe_card.dart';
import 'package:smart_kitchen/utils/ui/search_field.dart';
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
    final cubit = BlocProvider.of<RecipesCubit>(context);
    return BlocBuilder<RecipesCubit, RecipesState>(
      builder: (context, state) {
        return Scaffold(
          body: _buildContent(context, state, cubit),
        );
      },
    );
  }

  Widget _buildHeader(
    BuildContext context,
    RecipesState state,
    RecipesCubit cubit,
  ) {
    return Row(
      children: [
        Expanded(
          child: SearchField(
            hintText: Strings.searchRecipe,
            initialValue: state.searchString ?? '',
            key: const Key(Strings.searchRecipe),
            onChanged: cubit.changeSearchString,
          ),
        ),
        Spacings.s16,
        AnimatedContainer(
          duration: Constants.defaultAnimationDuration,
          width: state.isSearching ? 0 : 50,
          child: PopupMenuButton<String>(
            padding: EdgeInsets.zero,
            onSelected: (selected) {
              if (selected == 'new') {
                cubit.createNewRecipe();
              }
            },
            child: _buildMoreButton(),
            itemBuilder: (context) => popUpItems,
          ),
        ),
      ],
    );
  }

  Widget _buildMoreButton() {
    return Container(
      height: Constants.searchTextFieldSize,
      width: Constants.searchTextFieldSize,
      decoration: BoxDecoration(
        color: ColorPalette.wheat,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Icon(
        Icons.more_vert,
        color: ColorPalette.green,
        size: 26,
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    RecipesState state,
    RecipesCubit cubit,
  ) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: Paddings.all16,
            child: _buildHeader(context, state, cubit),
          ),
          Expanded(
            child: state.isSearching
                ? _searchRecipes(context, state, cubit)
                : _recipes(context, state, cubit),
          ),
        ],
      ),
    );
  }

  Widget _searchRecipes(
    BuildContext context,
    RecipesState state,
    RecipesCubit cubit,
  ) {
    return Padding(
      padding: Paddings.all16,
      child: showRecipes(state.filteredRecipes),
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
        Expanded(
          child: Padding(
            padding: Paddings.horizontal16,
            child: showRecipes(state.categoryRecipes),
          ),
        ),
      ],
    );
  }

  Widget categoryChips(
    BuildContext context,
    RecipesState state,
    RecipesCubit cubit,
  ) {
    return CategoryChips(
      selectedCategory: state.selectedCategory,
      onCategoryChanged: cubit.changeCategory,
    );
  }

  Widget showRecipes(List<Recipe> recipes) {
    return recipes.isNotEmpty
        ? ListView.separated(
            separatorBuilder: (context, index) => Spacings.s16,
            physics: const PageScrollPhysics(),
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              return RecipeCard(recipe: recipes[index]);
            },
          )
        : const Center(
            child: Text(Strings.noRecipes),
          );
  }
}
