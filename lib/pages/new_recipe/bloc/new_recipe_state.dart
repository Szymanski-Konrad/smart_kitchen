import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_kitchen/models/ingredient/ingredient.dart';
import 'package:smart_kitchen/models/recipe/category.dart';
import 'package:smart_kitchen/models/recipe/recipe.dart';
import 'package:smart_kitchen/models/step/recipe_step.dart';
import 'package:uuid/uuid.dart';

part 'new_recipe_state.freezed.dart';

@freezed
class NewRecipeState with _$NewRecipeState {
  factory NewRecipeState({
    required String id,
    required String uid,
    required String name,
    @Default(Category.notAssigned) Category category,
    @Default('') String imagePath,
    @Default('') String notes,
    @Default(0.0) double rating,
    @Default(<String, double>{}) Map<String, double> votes,
    required List<Ingredient> ingredients,
    required List<RecipeStep> steps,
    @Default(false) bool isSaving,
    @Default(false) bool isEditing,
  }) = _NewRecipeState;

  static NewRecipeState initial(String uid) => NewRecipeState(
        id: const Uuid().v1(),
        name: '',
        uid: uid,
        ingredients: [],
        steps: [],
        isSaving: false,
        isEditing: false,
      );

  static NewRecipeState fromRecipe(Recipe recipe) => NewRecipeState(
        id: recipe.id,
        uid: recipe.userId,
        name: recipe.name,
        steps: recipe.steps,
        ingredients: recipe.ingredients,
        category: recipe.category,
        imagePath: recipe.imagePath ?? '',
        isEditing: true,
        isSaving: false,
        notes: recipe.notes ?? '',
        rating: recipe.rating,
        votes: recipe.votes,
      );
}

extension NewRecipeStateExtension on NewRecipeState {
  bool get isValid => name.isNotEmpty && ingredients.isNotEmpty;

  bool get isImageSelected => imagePath.isNotEmpty;

  List<String> stepIngredientIds(String stepId) =>
      steps.firstWhere((element) => element.id == stepId).ingredients;

  bool get isAllIngredientsSelected => usedIngredients == ingredients.length;
  int get usedIngredients => steps.fold<int>(0,
      (previousValue, element) => previousValue + element.ingredients.length);
  int get unusedIngredients => ingredients.length - usedIngredients;

  List<Ingredient> stepAvailableIngredients(String stepId) {
    final usedIds = steps.map((step) => step.ingredients).flattened.toList();
    final step = steps.firstWhere((element) => element.id == stepId);
    for (final element in step.ingredients) {
      usedIds.remove(element);
    }
    return ingredients
        .where((element) => !usedIds.contains(element.id))
        .toList();
  }
}
