import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_kitchen/app/navigation/navigation.dart';
import 'package:smart_kitchen/app/navigation/routes.dart';
import 'package:smart_kitchen/features/hive/hive_database.dart';
import 'package:smart_kitchen/models/recipe/recipe.dart';
import 'package:smart_kitchen/pages/cooking/ui/cooking_page.dart';
import 'package:smart_kitchen/pages/recipe_details/bloc/recipe_details_state.dart';
import 'package:smart_kitchen/pages/recipes/bloc/recipes_cubit.dart';

class RecipeDetailsCubit extends Cubit<RecipeDetailsState> {
  RecipeDetailsCubit({required Recipe recipe, required this.uId})
      : super(RecipeDetailsState.initial(recipe));

  final HiveDatabase database = HiveDatabase();
  final String? uId;

  void changeScale(double scale) {
    emit(state.copyWith(scale: scale));
  }

  void changeRate(double rate) {
    emit(state.copyWith(stars: rate));
  }

  Future<void> rateRecipe(BuildContext context) async {
    final recipe = state.recipe;
    final uid = uId;
    if (uid != null) {
      emit(state.copyWith(
        recipe: recipe.copyWith(
          votes: recipe.updateVotes(uid, state.stars),
          rating: recipe.updateRating(uid, state.stars),
        ),
      ));
      await HiveDatabase.saveRecipe(state.recipe);
      BlocProvider.of<RecipesCubit>(context).updateRecipe(state.recipe);
    } else {
      //TODO: Show error when no uid
      throw UnimplementedError('Uid not set');
    }
  }

  void goToEditRecipe() {
    Navigation.instance
        .pushReplacement(SharedRoutes.newRecipe, arguments: state.recipe);
  }

  void goToCookingPage() {
    Navigation.instance.push(
      SharedRoutes.cooking,
      arguments: CookingPageArgument(recipe: state.recipe, scale: state.scale),
    );
  }
}
