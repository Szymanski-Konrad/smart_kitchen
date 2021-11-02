import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_kitchen/models/recipe/recipe.dart';

part 'recipe_details_state.freezed.dart';

@freezed
class RecipeDetailsState with _$RecipeDetailsState {
  const factory RecipeDetailsState({
    required Recipe recipe,
    required double scale,
    required double stars,
    double? kcal,
    double? fat,
    double? carbo,
    double? protein,
    double? salt,
    @Default(0) int calculatedIngredients,
  }) = _RecipeDetailsState;

  static RecipeDetailsState initial(Recipe recipe) =>
      RecipeDetailsState(recipe: recipe, scale: 1, stars: 3);
}

extension RecipeDetailsStateExtension on RecipeDetailsState {
  bool get hasImage => recipe.imageIncluded;

  bool get hasKcal => kcal != null && kcal! > 0;

  String get recipeRating =>
      '${recipe.rating.toStringAsFixed(1)} (${recipe.votes.length})';
}
